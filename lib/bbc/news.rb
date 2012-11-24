class News
  def initialize
    data = load

    data['entries'].each { |news_item|
      puts news_item['headline']
    }
  end

  private

  def url
    'http://www.bbc.co.uk/news/10284448/ticker.sjson'
  end

  def load
    begin
     raw = open(url, 'UserAgent' => BBC::USER_AGENT).read
     JSON.parse(raw)
    rescue
      puts "Unable to download news"
      exit
    end
  end

end
