# encoding: utf-8

# Shows schedule information for BBC Television and Radio stations
#
# Helpful urls
#
# http://www.bbc.co.uk/programmes/developers
# http://www.bbc.co.uk/ontologies/programmes/2009-09-07.shtml
#
class Schedule
  include ShellColors, Timings

  def initialize(io = STDOUT)
    @io = io
  end

  def load(channel)
    station = channel[:id]
    region = channel[:region] ||= ''
    period = channel[:period] ||= ''

    url = "http://www.bbc.co.uk/#{station}/programmes/schedules#{region}#{period}.json"
    raw = open(url, 'UserAgent' => AUNTIE::USER_AGENT).read
    data = JSON.parse(raw)

    list data, period
  end

  def list(data, period)
    now = time_now

    data['schedule']['day']['broadcasts'].each do |e|

      ends = Time.parse(e['end'])
      next if ends < now unless period == '/yesterday'

      title = e['programme']['display_titles']['title']
      # synopsis = e['programme']['short_synopsis']

      starts = Time.parse(e['start'])

      starts_at = starts.strftime('%H:%M') # "%I:%M%P"
      desc = "#{starts_at} #{title}"

      on_now = (starts < now && ends > now)
      desc = light_green desc if on_now

      @io.puts desc
    end
  end
end
