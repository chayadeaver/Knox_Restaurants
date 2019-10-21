
class KnoxRestaurants::Scraper
    attr_accessor :cuisine

   

    @@key = "FlT_U-hetuuWol3koMSchyQniIUHsbOKhhoQ1oow-eS16rDai1KLOPKi9azL1Rcs-uu-lVAWYGLM8oOHw7itln5wNFeZpFmRgwibomWs9lJ34-HE_UExjELukMekXXYx"


    def self.fetch_data
        
        url = "https://api.yelp.com/v3/businesses/search?term=restaurant&location=knoxville&limit=15"
        response = HTTParty.get(url, headers: {'Authorization' => "Bearer #{@@key}"})
        response.parsed_response
        response["businesses"].each do |a| #response["businesses"] later
            
            restaurant_name = a["name"]
            phone_number = a["display_phone"]
            address = a["location"]["display_address"].join(", ")
            cuisine = a["categories"].map{|type| type["title"]}
            url = a["url"]
            rating = a["rating"]
            price = a["price"]
    
            restaurant_hash = {
                :name => restaurant_name,
                :phone_number => phone_number,
                :cuisine => cuisine,
                :address => address,
                :url => url,
                :rating => rating,
                :price => price
            }
            KnoxRestaurants::Restaurant.new(restaurant_hash)  
        end
    end

    def self.all
        @@all
    end
    
end