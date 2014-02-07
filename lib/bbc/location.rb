# encoding: utf-8

# Discovers BBC location ids
#
class Location
  include ShellColors

  def initialize(io = STDOUT)
    @io = io
  end

  def find(place)
    fail 'Please use a longer search term' if place.length < 3

    @io.print "Searching for #{place}..."

    load(place)
  end

  def url(term)
    escaped = URI.encode(term)
    "http://www.bbc.co.uk/locator/default/en-GB/autocomplete.json?search=#{escaped}&filter=domestic&ptrt=/"
  end

  def load(place)
    begin
      raw = open(url(place), 'UserAgent' => AUNTIE::USER_AGENT).read
      data = JSON.parse(raw)
    rescue
      raise 'Unable to download location data'
    end

    @io.print "\r"

    if data.empty?
      @io.puts "No locations found matching '#{place}'   "
    else
      @io.puts sprintf '%-42s %-10s', 'Place', 'ID'
      data.each do |e|
        name = e['fullName'].split(',')
        place = light_green(name[0] + ',') + green(name[1])
        id = cyan e['id']

        @io.puts sprintf '%-60s %-10s', place, id
      end
    end
  end
end
