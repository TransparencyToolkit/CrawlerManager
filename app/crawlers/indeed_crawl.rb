class IndeedCrawl
  def initialize(search_query, location)
    @search_query = search_query
    @location = location
  end

  # Crawl Indeed
  def run
   i = IndeedCrawler.new(@search_query, @location, ENV['PROXYLIST'], [0.2, 0.3], 1)
   output = i.collect_it_all
   
   JSON.parse(output)
  end
end
