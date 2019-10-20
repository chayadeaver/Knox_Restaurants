class KnoxRestaurants::CLI
    #outputs to user
    def call
        puts "Welcome to Knoxville!"
        puts "What are you in the mood for?"
        KnoxRestaurants::Scraper.fetch_data
        puts KnoxRestaurants::Restaurant.get_cuisines
        
        
    end





end