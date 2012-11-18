class Location
  def initialize(term)
    abort "Please use a longer search term" if term.length < 3
    @url = "http://www.bbc.co.uk/locator/default/en-GB/autocomplete.json?search=" + term + "&filter=domestic&ptrt=/"

    load
  end

  def load
    begin
     raw = open(@url, 'UserAgent' => BBC::USER_AGENT).read
     data = JSON.parse(raw)
    rescue
      puts "Unable to download location data"
      exit
    end

    data[1].each do |e|
      name = e['fullName'].split(',')
      place = light_green(name[0]+ ',') + green(name[1])
      id = cyan e['id']

      puts sprintf "%-60s %-10s", place, id
    end
  end
end
