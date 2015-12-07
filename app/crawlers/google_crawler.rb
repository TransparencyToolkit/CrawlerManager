class GoogleCrawler
  def initialize(search_operators, search_query)
    @search_operators = search_operators
    @search_query = search_query
  end

  # Crawl Google
  def run
    @requests = RequestManager.new(ENV['PROXYLIST'], [1, 3], 1)
    captcha_settings = ENV['SOLVERDETAILS'] != nil ? {captcha_key: ENV['SOLVERDETAILS']} : nil
    g = GeneralScraper.new(@search_operators, @search_query, @requests, captcha_settings)
    output = JSON.parse(g.getData)
  end
end
