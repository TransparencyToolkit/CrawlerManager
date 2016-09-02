CrawlerManager
==============

API for running and managing crawlers and parsing results

CrawlerManager can be used in combination with [Harvester](https://github.com/TransparencyToolkit/Harvester) web interface to run queries and load results.

## Installing

Make sure you have the proper system dependencies with

- On Debian, do the following:
  - `sudo apt-get install sqlite3 libsqlite3-dev`
- Get the code `git clone https://github.com/TransparencyToolkit/CrawlerManager`
- Install Ruby dependencies `bundle install`

## Setup

- Create the databases `rake db:create:all`
- Reset existing databases `rake db:reset`

**WARNING**

Currently, for Harvester to save data, you need to have the path `/home/user/Data/KG/` and `/home/user/Data/KG/All_Pics/` to exist. This is kludgy and will be configurable soon!


## Running CrawlerManager

- Run the app by typing `rails server -p 9506`
- [Run a test crawl on public LinkedIn data for the term "xkeyscore"](http://0.0.0.0:3000/crawlers?crawler=GoogleCrawler&search_operators=site:linkedin.com/pub&search_query=xkeyscore)
- [Get details about specific crawler (e.g. Google)](http://0.0.0.0:3000/get_crawler_info?crawler=GoogleCrawler)
- [List all available crawlers](http://0.0.0.0:3000/list_crawlers)


### Additional Configuration

To use proxies, set environment variable PROXYLIST to the path to the
proxylist you want to use.

To solve CAPTCHAs, set environment variable SOLVERDETAILS to your 2Captcha key.
