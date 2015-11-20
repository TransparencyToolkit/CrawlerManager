API for running crawlers.

To setup-
1. rake db:create:all
2. rake db:reset
3. bundle install
4. rails server

To run crawler-
http://0.0.0.0:3000/crawlers?crawler=GoogleCrawler&search_operators=site:linkedin.com/pub&search_query=xkeyscore

Get details about specific crawler:
Input name of the crawler. For example-
http://0.0.0.0:3000/get_crawler_info?crawler=GoogleCrawler

List all available crawlers:
http://0.0.0.0:3000/list_crawlers
