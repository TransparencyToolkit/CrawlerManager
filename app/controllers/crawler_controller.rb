class CrawlerController < ApplicationController
  before_action :find_crawler, only: [:crawl, :get_crawler_info]

  # Process input to API and call appropriate crawler
  def crawl
    # Get list of parameters to pass to crawler (in correct order)
    params_for_crawler = @crawler.input_params.inject([]) do |arr, input_param|
      param_val = Base64.decode64(params[input_param[0]])
      arr.push(param_val)
    end

    # Initialize new crawler and run
    c = eval "#{@crawler.classname}.new(*#{params_for_crawler})"
    output = c.run
    
    # Return JSON response
    render json: JSON.pretty_generate(output)
  end

  # Get the info for specific parser
  def get_crawler_info
    render json: JSON.pretty_generate(@crawler.attributes)
  end

  # List all available parsers
  def list_crawlers
    crawler_list = Crawler.all.inject([]) {|arr, c| arr << c.attributes}
    render json: JSON.pretty_generate(crawler_list)
  end
  
  private

  # Find the matching parser
  def find_crawler
    @crawler = Crawler.find_by(classname: params[:crawler])
  end
end
