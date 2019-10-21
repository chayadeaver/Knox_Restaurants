class KnoxRestaurants::CLI
    #outputs to user
    def call
        KnoxRestaurants::Scraper.fetch_data
    
        puts "Welcome to Knoxville!" 
        print_cuisines
        input = ""

        puts "What are you in the mood for?"
        puts "Enter 'end' to exit"
        input = gets.strip.downcase
        print_restaurants(input.to_i)
        print_address(input.to_i)
    
        
    end

    def print_cuisines
      KnoxRestaurants::Restaurant.get_cuisines.each.with_index(1) do |cuisine, idx|
        puts "#{idx}. #{cuisine}"
      end
    end

    def print_restaurants(input)
      KnoxRestaurants::Restaurant.get_cuisine_restaurants(input).each.with_index(1) do |restaurant, idx|
        puts "#{idx}. #{restaurant.name}"
        binding.pry
      end
    end

    def print_address(input)
      KnoxRestaurants::Restaurant.get_address_restaurants(input).each do |restaurant|
        puts "#{restaurant.address}"
      end
    end

    def print_phone_number(input)
      KnoxRestaurants::Restaurant.get_phone_number_restaurants(input).each.with_index(1) do |restaurant, idx|
        puts "#{idx}. #{restaurant.phone_number}"
      end
    end
end
