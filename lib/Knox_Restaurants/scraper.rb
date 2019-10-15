
class KnoxRestaurants::Scraper
    attr_accessor :name

    @@all = []
    @@hash = {}

    @@key = "FlT_U-hetuuWol3koMSchyQniIUHsbOKhhoQ1oow-eS16rDai1KLOPKi9azL1Rcs-uu-lVAWYGLM8oOHw7itln5wNFeZpFmRgwibomWs9lJ34-HE_UExjELukMekXXYx"


    def self.fetch_data
    url = "https://api.yelp.com/v3/businesses/search?term=restaurant&location=knoxville&limit=5"
    response = HTTParty.get(url, headers: {'Authorization' => "Bearer #{@@key}"})
    response.parsed_response
        binding.pry

    end

    def self.all
        @@all
    end
    
end