class GoogleCrawler
  def initialize(search_operators, search_query)
    @search_operators = search_operators
    @search_query = search_query
  end

  # Crawl Google
  def run
    @requests = RequestManager.new(nil, [1, 3], 1)
    g = GeneralScraper.new(@search_operators, @search_query, @requests, nil)
    output = JSON.parse(g.getData)
    # TODO: Add support for proxies and captcha solver
  end
end
