class Sport
  def initialize
    data = load

    data['entries'].each { |item|
      prompt = yellow item['prompt'].capitalize.ljust(22)

      headline = item['headline']
      puts prompt+headline
    }
  end

  private

  def url
    'http://polling.bbc.co.uk/sport/0/16189337/ticker.sjson'
  end

  def load
    begin
     raw = open(url, 'UserAgent' => BBC::USER_AGENT).read
     JSON.parse(raw)
    rescue
      puts "Unable to download sport"
      exit
    end
  end

end
