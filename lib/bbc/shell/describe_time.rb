# encoding: utf-8

module Timings
  def how_long_between past, future
    a = (future-past).to_i

    case a
    when -10000000...0 then "On now"
    when 0 then 'Now!'
    when 1 then 'A second'
    when 2..59 then a.to_s+' secs'
    when 60..119 then 'A min' #120 = 2 minutes
    when 120..3540 then (a/60).to_i.to_s+' mins'
    when 3541..7100 then 'An hour' # 3600 = 1 hour
    when 7101..82800 then ((a+99)/3600).to_i.to_s+' hours'
    when 82801..172000 then 'A day' # 86400 = 1 day
    when 172001..518400 then ((a+800)/(60*60*24)).to_i.to_s+' days'
    when 518401..1036800 then 'A week'
    else ((a+180000)/(60*60*24*7)).to_i.to_s+' weeks'
    end
  end

  def time_now
    Time.now
  end

  module_function :how_long_between, :time_now
end
