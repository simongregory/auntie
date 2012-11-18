# Helpful urls
#
# http://www.bbc.co.uk/programmes/developers
# http://www.bbc.co.uk/ontologies/programmes/2009-09-07.shtml

class Schedule
  def initialize(channel)
    load channel
  end

  def load channel
    station = channel[:id]
    region = channel[:region] ||= ''
    period = channel[:period] ||= ''

    url = "http://www.bbc.co.uk/#{station}/programmes/schedules#{region}#{period}.json"
    raw = open(url, 'UserAgent' => 'bbc-programmes-cli-v0.1.0').read
    data = JSON.parse(raw)

    list data
  end

  def list data
    now = Time.new

    data['schedule']['day']['broadcasts'].each do |e|

      ends = Time.parse(e['end'])

      next if ends < now

      title = e['programme']['display_titles']['title']
      #synopsis = e['programme']['short_synopsis']

      starts = Time.parse(e['start'])

      starts_at = starts.strftime("%H:%M")
      #starts_at = starts.strftime("%I:%M%P")
      desc = "#{starts_at} #{title}"

      if (starts < now) && (ends > now)
        desc = light_green desc
      end

      puts desc
    end
  end
end
