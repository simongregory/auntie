# encoding: utf-8

class Sport
  include ShellColors

  def initialize(io=STDOUT)
    @io = io
  end

  def headlines
    data['entries'].each { |item|
      prompt = yellow item['prompt'].capitalize.ljust(22)

      headline = item['headline']
      @io.puts prompt+headline
    }
  end

  private

  def url
    'http://polling.bbc.co.uk/sport/0/16189337/ticker.sjson'
  end

  def data
    begin
     raw = open(url, 'UserAgent' => AUNTIE::USER_AGENT).read
     JSON.parse(raw)
    rescue
      @io.puts "Unable to download sport"
      exit
    end
  end

end
