class TwitterCrawl
  def initialize(harvester_url, selector_id, search_query, search_operators)
    @search_operators = search_operators
    @search_query = search_query
    @harvester_url = harvester_url
    @selector_id = selector_id
  end

  # Crawl LinkedIn
  def run
    Thread.new do
      # Setup incremental result passing hash
      cm_hash = {crawler_manager_url: @harvester_url,
               selector_id: @selector_id}

      # Setup request info
      requests_twitter = RequestManager.new(ENV['PROXYLIST'], [1, 3], 1)
      
      # Scrape
      t = TwitterCrawler.new(@search_query, @search_operators, requests_twitter, cm_hash)
      t.crawl
    end
  end
end
