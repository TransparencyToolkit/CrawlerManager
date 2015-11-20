# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

crawlers = [
  ["Google", "Crawls Google", {search_operators: "string", search_query: "string"}, "GoogleCrawler"]
]

crawlers.each do |name, description, input_params, classname|
  Crawler.create(name: name, description: description, input_params: input_params, classname: classname)
end
