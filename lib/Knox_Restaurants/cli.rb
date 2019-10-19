class KnoxRestaurants::CLI
    #outputs to user
    def call
        puts "Welcome to Knoxville!"
        start
        KnoxRestaurants::Scraper.fetch_data

    end

    def start
     puts "What are you in the mood for?"
     
    #  input = gets.chomp

    end

end