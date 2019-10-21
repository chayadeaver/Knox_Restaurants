class KnoxRestaurants::CLI
    #outputs to user
    def call
        KnoxRestaurants::Scraper.fetch_data
        puts "Welcome to Knoxville!" 
        print_cuisines

        input = ""

        while input != "end"
        puts "What are you in the mood for?"
        puts "Enter 'end' to exit"
        input = gets.strip.downcase
          if input != "end"
            print_restaurants(input.to_i)
          end
          exit
        end 
    end

    def print_cuisines
      KnoxRestaurants::Restaurant.get_cuisines.each.with_index(1) do |cuisine, idx|
        puts "#{idx}. #{cuisine}"
      end
    end

    def print_restaurants(input)
      KnoxRestaurants::Restaurant.get_cuisine_restaurants(input).each.with_index(1) do |restaurant, idx|
        puts <<~REST
        #{idx}. #{restaurant.name}
        #{restaurant.address}
        #{restaurant.phone_number}
        REST
      
      end
    end

    def exit
      puts "Thanks for visiting Knoxville. Have a nice day."
    end
end
