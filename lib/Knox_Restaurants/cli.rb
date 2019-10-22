class KnoxRestaurants::CLI
    #outputs to user
    def call
        KnoxRestaurants::API.fetch #fetches from API
        puts "Welcome to Knoxville!" 
        puts "What are you in the mood for?"
        print_cuisines

        input = ""
        while input != "end"
        puts "Enter 'end' to exit"
        input = gets.strip.downcase
          if input == "end"
            exit
          elsif input.to_i.between?(1, @cuisine.length)
            print_restaurants(input.to_i)
            puts "To find out more, enter the number for which restaurant you want" 
            print_details(input = gets.to_i)
          else
            puts "I don't understand. Please pick another cuisine"
          end
        end 
        
    end

    def print_cuisines
      @cuisine = KnoxRestaurants::Restaurant.get_cuisines.each.with_index(1) do |cuisine, idx|
        puts "#{idx}. #{cuisine}"
      end
    end

    def print_restaurants(input)
      @restaurant = KnoxRestaurants::Restaurant.get_cuisine_restaurants(input).each.with_index(1) do |r, idx|
        puts "#{idx}. #{r.name}"

       end
    end

    def print_details(input)
      r = @restauarant[input - 1]
      puts <<~R
        Address: #{r.address}
        Phone number: #{r.phone_number}
        Website: #{r.url}
        Rating: #{r.rating} of 5
        Price Range: #{r.price}
        Reviews: #{r.reviews}
        R
      
    end

    def exit
      puts "Thanks for visiting Knoxville. Have a nice day."
    end
end
