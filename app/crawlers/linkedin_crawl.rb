class LinkedinCrawl
  def initialize(search_query)
    @search_query = search_query
  end

  # Crawl LinkedIn
  def run
    requests_linkedin = RequestManager.new(ENV['PROXYLIST'], [1, 3], 5) 
    requests_google = RequestManager.new(ENV['PROXYLIST'], [1, 3], 1)
    captcha_settings = ENV['SOLVERDETAILS'] != nil ? {captcha_key: ENV['SOLVERDETAILS']} : nil
    c = LinkedinCrawler.new(@search_query, 1, requests_linkedin, requests_google, captcha_settings)
    c.search
    JSON.parse(c.gen_json)
  end
end
