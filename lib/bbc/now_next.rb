# encoding: utf-8

# Lists what is airing now and next accross BBC Radio and Television stations
#
class NowNext
  include Timings

  def initialize(io = STDOUT)
    @io = io
  end

  def tv_now
    @fmt = '%-18s %s'
    load 'tv'

    on_now
  end

  def tv_next
    @fmt = '%-18s %s'
    load 'tv'

    on_next
  end

  def radio_now
    @fmt = '%-32s %s'
    load 'radio'

    on_now
  end

  def radio_next
    @fmt = '%-32s %s'
    load 'radio'

    on_next
  end

  private

  Programme = Struct.new(:channel, :title, :starts, :starts_in)

  def load(medium)
    begin
      raw = open("http://www.bbc.co.uk/iplayer/ion/multinownext/service_type/#{medium}/simulcast_only/1/format/json", 'UserAgent' => AUNTIE::USER_AGENT).read
      @data = JSON.parse(raw)
    rescue
      raise "Unable to download #{medium} schedules"
    end
  end

  def on_now
    @data['blocklist'].each do |e|
      channel = format_channel e['title']
      programme = e['now'][0]['episode']['passionsite_title'] rescue next

      @io.puts sprintf @fmt, channel, programme
    end
  end

  def on_next
    programmes = []

    second = 0

    @data['blocklist'].each do |e|
      p = Programme.new
      p.channel = format_channel e['title']

      p.title = e['next'][0]['episode']['passionsite_title'] rescue ''
      p.starts = Time.parse(e['next'][0]['start_time_iso']) rescue ''

      # next_start = starts.strftime("%H:%M")
      p.starts_in = how_long_between(time_now, p.starts)

      second = p.channel.length + 3 if p.channel.length > second

      programmes << p
    end

    programmes.sort_by! { |p| p.starts }

    programmes.each do |p|
      @io.puts sprintf("%-9s %-#{second}s %s", p.starts_in, p.channel, p.title)
    end
  end

  def format_channel(name)
    name.gsub(/^BBC | (London|England|Channel)/, '')
  end
end
