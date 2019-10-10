## You want to require all the files here so when you run bin/knox_restaurants you have access to everything!
require_relative "./knox_restaurants/version"
require_relative "./knox_restaurants/cli"
require_relative "./knox_restaurants/restaurant"
require "pry"


module KnoxRestaurants
  class Error < StandardError; end
  # Your code goes here...
end
