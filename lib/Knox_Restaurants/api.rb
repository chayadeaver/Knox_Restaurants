
class KnoxRestaurants::API
    attr_accessor :cuisine

    def self.fetch
        key = ENV["API_KEY"]
        url = "https://api.yelp.com/v3/businesses/search?term=restaurant&location=knoxville&limit=50"
        response = HTTParty.get(url, headers: {'Authorization' => "Bearer #{key}"})
        response.parsed_response
        response["businesses"].each do |a| 
            
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
    
end