CrawlerManager
==============

API for running and managing crawlers

## Installing

Make sure you have the proper system dependencies with

- On Debian, do the following:
  - `sudo apt-get install postgresql postgresql-client sqlite3 libsqlite3-dev libpq-dev ruby-pg`
  - Configure [PostGreSQL](https://wiki.debian.org/PostgreSql)
- Get the code `git clone https://github.com/TransparencyToolkit/DocumentLoader`
- Install Ruby dependencies `bundle install`

## Setup

- Create the databases `rake db:create:all`
- Reset existing databases `rake db:reset`

## Running CrawlerManager

- Run the app by typing `rails server -p 9506`
- [Run a test crawl on public LinkedIn data for the term "xkeyscore"](http://0.0.0.0:3000/crawlers?crawler=GoogleCrawler&search_operators=site:linkedin.com/pub&search_query=xkeyscore)
- [Get details about specific crawler (e.g. Google)](http://0.0.0.0:3000/get_crawler_info?crawler=GoogleCrawler)
- [List all available crawlers](http://0.0.0.0:3000/list_crawlers)


### Additional Configuration

To use proxies, set environment variable PROXYLIST to the path to the
proxylist you want to use.

To solve CAPTCHAs, set environment variable SOLVERDETAILS to your 2Captcha key.
