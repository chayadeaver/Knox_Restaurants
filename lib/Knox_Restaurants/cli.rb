class KnoxRestaurants::CLI
    #outputs to user
    def call
        puts "Welcome to Knoxville!"
        start
        KnoxRestaurants::Scraper.fetch_data
        # KnoxRestaurants::Restaurant.all.each{|rest| puts rest.cuisine}.uniq
        KnoxRestaurants::Restaurant.cuisines

    end

    def start
     puts "What are you in the mood for?"
     
    #  input = gets.chomp

    #  case input
    #  when 

    #  end


    end


end