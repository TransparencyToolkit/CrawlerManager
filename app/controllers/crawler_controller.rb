class CrawlerController < ApplicationController
  before_action :find_crawler, only: [:crawl, :get_crawler_info]

  # Process input to API and call appropriate crawler
  def crawl
    # Match up with Harvester instance and object
    selector_tag = Base64.decode64(params["selector-tag"])
    harvester_path = Base64.decode64(params["harvester-path"])
    
    # Get list of parameters to pass to crawler (in correct order)
    params_for_crawler = [harvester_path, selector_tag]
    @crawler.input_params.each do |input_param|
      params_for_crawler.push(Base64.decode64(params[input_param[0]]))
    end
    
    # Initialize new crawler and run
    c = Module.const_get(@crawler.classname).new(*params_for_crawler)
    c.run
    move_pics

    render json: JSON.pretty_generate(@crawler.attributes)
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

  # Handle pictures
  def move_pics
    picdir = ENV['HOME']+"/Data/KG/All_Pics"
    unless File.directory?(picdir)
      Dir.mkdir(picdir)
    end
    `mv pictures/* #{ENV['HOME']}/Data/KG/All_Pics`
    `rm -r pictures`
  end

  # Find the matching parser
  def find_crawler
    @crawler = Crawler.find_by(classname: params[:crawler])
  end
end
