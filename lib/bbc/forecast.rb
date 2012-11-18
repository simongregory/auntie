class Forecast
  def initialize(location)
    @url = "http://open.live.bbc.co.uk/weather/feeds/en/#{location}/3hourlyforecast.json"

    load
  end

  def load
    begin
     raw = open(@url, 'UserAgent' => Weather::USER_AGENT).read
     hourly JSON.parse(raw)
    rescue
      puts "Unable to download hourly weather"
    end
  end

  def hourly feed
    puts "Hourly weather for " + feed['forecastContent']['location']['locationName']

    feed['forecastContent']['forecasts'].each { |e|
      day = sprintf "%-10s", e['dayName']

      time = sprintf "%-7s", e['timeSlot']

      desc = sprintf "%-17s", e['weatherType']

      temp = e['temperature']['centigrade'].to_s
      temp = sprintf "%-6s", "#{temp}\xC2\xB0C" unless temp.nil?

      wind = e['wind']['directionDesc']
      wind_spd = e['wind']['windspeed']['mph']
      wind_spd = "#{wind_spd}mph" unless wind_spd.nil?
      wind_desc = sprintf "%-6s %-20s", wind_spd, wind

      puts "#{yellow day} #{time} #{desc} #{temp} #{wind_desc}"
    }
  end
end
