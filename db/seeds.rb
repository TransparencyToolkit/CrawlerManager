# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

crawlers = [
  ["Google", "icon-google", "Crawls Google search results", {search_operators: "string", search_query: "string"}, "GoogleCrawler", [
     :text,
     :url,
     :date_retrieved,
     :title]],
  ["LinkedIn", "icon-linkedin", "Crawls LinkedIn public profiles", {search_query: "string"}, "LinkedinCrawl", [
     :profile_url,
     :full_name,
     :first_name,
     :last_name,
     :skills,
     :full_location,
     :location,
     :area,
     :industry,
     :summary,
     :current_title,
     :interests,
     :number_of_connections,
     :picture,
     :pic_path,
     :full_html,
     :title,
     :company,
     :description,
     :start_date,
     :end_date,
     :work_location,
     :current,
     :timestamp,
     :search_terms]]
]

crawlers.each do |name, icon, description, input_params, classname, output_fields|
  Crawler.create(name: name, icon: icon, description: description, input_params: input_params, classname: classname, output_fields: output_fields)
end
