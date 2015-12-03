class GoogleCrawler
  def initialize(search_operators, search_query)
    @search_operators = search_operators
    @search_query = search_query
  end

  # Crawl Google
  def run
    @requests = RequestManager.new(nil, [1, 3], 1)
    g = GeneralScraper.new(@search_operators, @search_query, @requests)
    output = JSON.parse(g.getData)
    # Change to getting page text/separate parser/crawler
  end
end
