# encoding: utf-8

#http://www.utf8-chartable.de/unicode-utf8-table.pl

module ShellCharacters

  def west
    "\xe2\x86\x90"
  end

  def east
    "\xe2\x86\x92"
  end

  def south
    "\xe2\x86\x93"
  end

  def north
    "\xe2\x86\x91"
  end

  def north_west
    "\xe2\x86\x96"
  end

  def north_east
    "\xe2\x86\x97"
  end

  def south_west
    "\xe2\x86\x99"
  end

  def south_east
    "\xe2\x86\x98"
  end

  def degrees_c
    "\xC2\xB0C" #Shell escaped °C
  end

  def degrees_f
    "\xC2\xB0F" #Shell escaped °F
  end

  def square_block
    "\xe2\x96\x88"
  end

  def symbol_for_compass(direction)
    case direction
      when 'N' then north
      when 'NNE' then north
      when 'NE' then north_east
      when 'ENE' then east
      when 'E' then east
      when 'ESE' then east
      when 'SE' then south_east
      when 'SSE' then south
      when 'S' then south
      when 'SSW' then south
      when 'SW' then south_west
      when 'WSW' then west
      when 'W' then west
      when 'WNW' then west
      when 'NW' then north_west
      when 'NNW' then north
      else north
    end
  end

  module_function :symbol_for_compass,
                  :north, :east, :south, :west,
                  :north_east, :south_east, :south_west, :north_west,
                  :degrees_c, :degrees_f, :square_block

end