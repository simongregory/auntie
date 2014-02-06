# encoding: utf-8

class NowNext
  include Timings

  def initialize(io=STDOUT)
    @io = io
  end

  def tv_now
    @fmt = "%-18s %s"
    load 'tv'

    on_now
  end

  def tv_next
    @fmt = "%-18s %s"
    load 'tv'

    on_next
  end

  def radio_now
    @fmt = "%-32s %s"
    load 'radio'

    on_now
  end

  def radio_next
    @fmt = "%-32s %s"
    load 'radio'

    on_next
  end

  private

  Programme = Struct.new(:channel, :title, :starts, :starts_in)

  def load medium
    begin
     raw = open("http://www.bbc.co.uk/iplayer/ion/multinownext/service_type/#{medium}/simulcast_only/1/format/json", 'UserAgent' => AUNTIE::USER_AGENT).read
     @data = JSON.parse(raw)
    rescue
      raise "Unable to download #{medium} schedules"
    end
  end

  def on_now
    @data['blocklist'].each { |e|
      channel = format_channel e['title']
      programme = e['now'][0]['episode']['passionsite_title'] rescue next

      @io.puts sprintf @fmt, channel, programme
    }
  end

  def on_next
    programmes = []

    first = 9
    second = 0

    @data['blocklist'].each { |e|
      p = Programme.new
      p.channel = format_channel e['title']

      p.title = e['next'][0]['episode']['passionsite_title'] rescue ''
      p.starts = Time.parse(e['next'][0]['start_time_iso']) rescue ''

      #next_start = starts.strftime("%H:%M")
      p.starts_in = how_long_between(time_now, p.starts)

      second = p.channel.length+3 if p.channel.length > second

      programmes << p
    }

    programmes.sort_by! { |p| p.starts }

    programmes.each { |p|  @io.puts sprintf "%-#{first}s %-#{second}s %s", p.starts_in, p.channel, p.title }
  end

  def format_channel name
    name.gsub(/^BBC | (London|England|Channel)/,'')
  end
end
