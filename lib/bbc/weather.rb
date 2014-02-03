# encoding: utf-8

class Weather
  include ShellCharacters

  attr_reader :base_url

  def initialize(location, io=STDOUT)
    @io = io
    @base_url = "http://open.live.bbc.co.uk/weather/feeds/en/#{location}"
  end

  def hourly
    feed = load("#{base_url}/3hourlyforecast.json")

    location = feed['forecastContent']['location']['locationName']

    @io.puts "\nThe next 24 hours in #{location}\n\n"
    @io.puts "Day        Time    Weather            Max#{degrees_c}    Wind"

    feed['forecastContent']['forecasts'].each { |e|

      day = e['dayName'].ljust(10)
      time = e['timeSlot'].ljust(7)
      desc = e['weatherType'].ljust(19)

      temp = e['temperature']['centigrade'].to_s || '?'
      temp = "#{temp}#{degrees_c}".ljust(6)

      wind = e['wind']['directionDesc']
      wind_dir = e['wind']['direction']
      wind_spd = e['wind']['windspeed']['mph'] || '?'
      wind_spd = "#{wind_spd}mph".ljust(5)

      #visibility = e['visibility']
      #millibars = e['pressureMillibars']
      #humidity = e['humidityPercent']
      #temp_colour = temp_to_color(temp.to_i)

      @io.puts "#{yellow day} #{time} #{desc} #{temp} #{wind_spd} #{wind}"
    }
    @io.puts "\n"
  end

  def daily
    feed = load("#{base_url}/3dayforecast.json")

    location = feed['forecastContent']['location']['locationName']

    @io.puts "\nThe next 3 days in #{location}\n\n"
    @io.puts "Day        Time    Weather            Max#{degrees_c}    Wind"

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

      @io.puts "#{yellow day} #{day_desc} #{cyan 'night'} #{white night_desc}"
    }
  end

  private

  def load(url)
    begin
     raw = open(url, 'UserAgent' => AUNTIE::USER_AGENT).read
     JSON.parse(raw)
    rescue
      @io.puts "Unable to download the weather"
      exit
    end
  end

  #def temp_to_color(temp)
  #  case temp
  #  when -100..0 then blue(square_block)
  #  when 0..10 then yellow(square_block)
  #  else red(square_block)
  #  end
  #end

end
