## You want to require all the files here so when you run bin/knox_restaurants you have access to everything!
require_relative "./knox_restaurants/version"
require_relative "./knox_restaurants/cli"
require_relative "./knox_restaurants/restaurant"
require_relative "./knox_restaurants/api"
require "pry"
require "nokogiri"
require "open-uri"
require "httparty"
require "dotenv/load"


module KnoxRestaurants
  class Error < StandardError; end
  # Your code goes here...
end
