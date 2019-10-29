
class KnoxRestaurants::API

    attr_reader :restaurants

    def initialize
        # key = ENV["KEY"]
        key = ENV["API_KEY"]
        url = "https://api.yelp.com/v3/businesses/search?term=restaurant&location=knoxville&limit=50"
        response = HTTParty.get(url, headers: {'Authorization' => "Bearer #{key}"})
        response.parsed_response
        @restaurants = response["businesses"].collect do |a| 
            
            restaurant_name = a["name"]
            phone_number = a["display_phone"]
            address = a["location"]["display_address"].join(", ")
            cuisine = a["categories"].map{|type| type["title"]}
            url = a["url"]
            rating = a["rating"]
            price = a["price"]
            reviews = a["review_count"]
    
            restaurant_hash = {
                :name => restaurant_name,
                :phone_number => phone_number,
                :cuisine => cuisine,
                :address => address,
                :url => url,
                :rating => rating,
                :price => price,
                :reviews => reviews
            }
         
            KnoxRestaurants::Restaurant.new(restaurant_hash)  
        end
    end

    def self.all
        @@all
    end

    def get_cuisines 
        #displays a list of cuisines with no duplicates
        restaurants.collect{|r| r.cuisine}.flatten.uniq
    end

    def get_cuisine_restaurants(num)
        #compares the user input as an integer to find the cuisine that matches the Restaurant instance
      cuisine = self.get_cuisines[num-1]
      rest = restaurants.select {|r| r.cuisine.include?(cuisine)}
    end
    
end