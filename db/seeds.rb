# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

crawlers = [
  ["Files or Folders", "icon-folder", "Load files from your computer and extract data", {directory: "file"},
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
   ], { primary_id_field: "rel_path" }
  ],
  ["Google", "icon-google", "Crawls search results from Google.com", {search_operators: "string", search_query: "string"}, "GoogleCrawl", [
     :text,
     :url,
     :date_retrieved,
     :title], {}],
  ["Indeed", "icon-indeed", "Crawls job resumes from Indeed.com", {search_query: "string", location: "string"}, "IndeedCrawl", [
     :url,
     :name,
     :location,
     :current_title,
     :skills,
     :summary,
     :additional_info,
     :last_updated,
     :fulltext,
     :time_scraped,
     :company,
     :job_title,
     :start_date,
     :end_date,
     :job_description,
     :company_location
   ], { primary_id_field: "url",
        secondary_id_field: ["company", "job_title", "start_date"],
        get_id_after: "indeed.com/"}],
  ["LinkedIn", "icon-linkedin", "Crawls public profiles from LinkedIn.com", {search_query: "string"}, "LinkedinCrawl", [
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
     :search_terms],
   { primary_id_field: "profile_url",
     secondary_id_field: ["company", "title", "start_date"],
     get_id_after: "linkedin.com/pub"}
  ]
]

crawlers.each do |name, icon, description, input_params, classname, output_fields, id_fields|
  Crawler.create(name: name, icon: icon, description: description, input_params: input_params, classname: classname, output_fields: output_fields, id_fields: id_fields)
end
