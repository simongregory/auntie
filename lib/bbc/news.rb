# encoding: utf-8

class News
  def initialize(io = STDOUT)
    @io = io
  end

  def load
    cols = console_columns
    @io.puts 'BBC News Headlines'
    data['entries'].each { |news_item|
      @io.puts news_item['headline'][0..cols - 1]
    }
  end

  private

  def data
    begin
     raw = open('http://www.bbc.co.uk/news/10284448/ticker.sjson', 'UserAgent' => AUNTIE::USER_AGENT).read
     JSON.parse(raw)
    rescue
      raise 'Unable to download news'
    end
  end

  def console_columns
    IO.console.winsize[1]
  end
end
