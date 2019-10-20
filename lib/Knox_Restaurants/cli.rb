class KnoxRestaurants::CLI
    #outputs to user
    def call
        puts "Welcome to Knoxville!"
        start
        KnoxRestaurants::Scraper.fetch_data
        KnoxRestaurants::Restaurant.print_cuisines
        # KnoxRestaurants::Restaurant.restaurant_by_cuisine

        # KnoxRestaurants::Restaurant.all.each{|rest| puts rest.cuisine}.uniq
        
    end

    def start
     puts "What are you in the mood for?"
     
    #

        #create a statement that compares user input with corresponding instances of 
        #Restaurant class
        #choose "burgers" and it should print out names of restaurants
        #that belong to "burgers"
    end


end