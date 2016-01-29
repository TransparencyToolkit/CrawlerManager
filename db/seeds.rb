# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

crawlers = [
  ["Local Files", "icon-google", "OCRs, extracts metadata from, and loads in files on your local computer", {directory: "file"},
   "LoadFiles", [
     :text,
     :full_path,
     :rel_path,
     :formatted_name,
     :filetype,
     :author,
     :creator,
     :producer,
     :title,
     :subject,
     :date,
     :keywords,
     :length
   ]],
  ["Google", "icon-google", "Crawls Google search results", {search_operators: "string", search_query: "string"}, "GoogleCrawler", [
     :text,
     :url,
     :date_retrieved,
     :title]],
  ["Indeed", "icon-linkedin", "Collects Indeed resumes", {search_query: "string", location: "string"}, "IndeedCrawl", [
     :url,
     :name,
     :location,
     :current_title,
     :skills,
     :summary,
     :additional_info,
     :last_updated,
     :fulltext,
     :time_scraped
   ]],
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
