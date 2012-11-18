class Forecast
  def initialize(location)
    @location = location
  end

  def hourly
    feed = load("#{base_url}/3hourlyforecast.json")

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

  def daily
    feed = load("#{base_url}/3dayforecast.json")

    feed['forecastContent']['forecasts'].each { |e|
      day = sprintf "%-10s", e['dayName']

      d_weather = e['day']['weatherType']
      d_weather = sprintf "%-12s", d_weather unless d_weather.nil?

      d_temp = e['day']['maxTemperature']['centigrade']
      d_temp = "#{d_temp}\xC2\xB0C" unless d_temp.nil?

      d_wind = e['day']['wind']['directionDesc']
      d_wind_spd = e['day']['wind']['windspeed']['mph']
      d_wind_spd = "#{d_wind_spd}mph" unless d_wind_spd.nil?

      day_desc = sprintf "%-17s %-6s %-5s %-20s", d_weather, d_temp, d_wind_spd, d_wind

      n_weather = e['night']['weatherType']
      n_temp = e['night']['minTemperature']['centigrade']
      n_temp = "#{n_temp}\xC2\xB0C" unless n_temp.nil?

      night_desc = sprintf "%-12s %-3s", n_weather, n_temp

      puts "#{yellow day} #{day_desc} #{cyan 'night'} #{white night_desc}"
    }
  end

  private

  def base_url
    "http://open.live.bbc.co.uk/weather/feeds/en/#{@location}"
  end

  def load(url)
    begin
     raw = open(url, 'UserAgent' => BBC::USER_AGENT).read
     JSON.parse(raw)
    rescue
      puts "Unable to download weather"
      exit
    end
  end

end
