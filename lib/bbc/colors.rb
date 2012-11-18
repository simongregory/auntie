# Useful list of colour codes
# http://misc.flogisoft.com/bash/tip_colors_and_formatting

def paint txt, color
  "\033[#{color}m#{txt}\033[0m"
end

def green txt
  paint txt, '32'
end

def red txt
  paint txt, '31'
end

def light_green txt
  paint txt, '92'
end

def yellow txt
  paint txt, '33'
end

def cyan txt
  paint txt, 36
end
