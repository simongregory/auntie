# encoding: utf-8

# Collection of time related methods awaiting a relevantly named module.
#
module Timings
  def how_long_between(past, future)
    a = (future - past).to_i

    case a
    when -10_000_000...0 then 'On now'
    when 0 then 'Now!'
    when 1 then 'A second'
    when 2..59 then a.to_s + ' secs'
    when 60..119 then 'A min' # 120 = 2 minutes
    when 120..3_540 then (a / 60).to_i.to_s + ' mins'
    when 3_541..7_100 then 'An hour' # 3600 = 1 hour
    when 7_101..82_800 then ((a + 99) / 3600).to_i.to_s + ' hours'
    when 82_801..172_000 then 'A day' # 86400 = 1 day
    when 172_001..518_400 then ((a + 800) / (60 * 60 * 24)).to_i.to_s + ' days'
    when 518_401..1_036_800 then 'A week'
    else ((a + 180_000) / (60 * 60 * 24 * 7)).to_i.to_s + ' weeks'
    end
  end

  def time_now
    Time.now
  end

  module_function :how_long_between, :time_now
end
