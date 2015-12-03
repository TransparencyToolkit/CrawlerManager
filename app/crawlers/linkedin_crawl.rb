class LinkedinCrawl
  def initialize(search_query)
    @search_query = search_query
  end

  # Crawl LinkedIn
  def run
    # TODO: Set proxy info on start (except interval- that's by data source)
    requests_linkedin = RequestManager.new(nil, [1, 3], 1) 
    requests_google = RequestManager.new(nil, [1, 3], 1) 
    c = LinkedinCrawler.new(@search_query, 1, requests_linkedin, requests_google)
    c.search
    JSON.parse(c.gen_json)
  end
end
