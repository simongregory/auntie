class Schedule
  def initialize(data)
    service_details data
  end

  def service_details data
    now = Time.new

    data['schedule']['day']['broadcasts'].each do |e|

      ends = Time.parse(e['end'])

      next if ends < now

      title = e['programme']['display_titles']['title']
      #synopsis = e['programme']['short_synopsis']

      starts = Time.parse(e['start'])

      starts_at = starts.strftime("%I:%M%P")
      desc = "#{starts_at} #{title}"

      if (starts < now) && (ends > now)
        desc = red desc
      end

      puts desc
    end
  end
end
