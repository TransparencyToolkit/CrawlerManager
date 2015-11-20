class GoogleCrawler
  def initialize(search_operators, search_query)
    @search_operators = search_operators
    @search_query = search_query
  end

  def run
    @requests = RequestManager.new(nil, [1, 3], 1)
    binding.pry
    @requests.get_page("http://google.com", @search_operators + " " + @search_query)
  end
end
