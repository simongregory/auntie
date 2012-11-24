class NowNext
  def initialize(medium)
    @fmt = (medium == 'tv') ? "%-18s %s" : "%-32s %s"
    url = "http://www.bbc.co.uk/iplayer/ion/multinownext/service_type/#{medium}/simulcast_only/1/format/json"
    raw = open(url, 'UserAgent' => 'bbc-programmes-cli-v0.1.0').read
    @data = JSON.parse(raw)
  end

  def now
    @data['blocklist'].each { |e|
      channel = format_channel e['title']
      programme = e['now'][0]['episode']['passionsite_title'] rescue next

      puts sprintf @fmt, channel, programme
    }
  end

  Programme = Struct.new(:channel, :title, :starts, :starts_in)

  def next
    programmes = []

    first = 9
    second = 0

    @data['blocklist'].each { |e|
      p = Programme.new
      p.channel = format_channel e['title']

      p.title = e['next'][0]['episode']['passionsite_title'] rescue ''
      p.starts = Time.parse(e['next'][0]['start_time_iso']) rescue ''

      #next_start = starts.strftime("%H:%M")
      p.starts_in = how_long_until(p.starts)

      second = p.channel.length+3 if p.channel.length > second

      programmes << p
    }

    programmes.sort_by! { |p| p.starts }

    programmes.each { |p|  puts sprintf "%-#{first}s %-#{second}s %s", p.starts_in, p.channel, p.title }

  end

  private

  def format_channel name
    name.gsub(/^BBC | (London|England|Channel)/,'')
  end
end