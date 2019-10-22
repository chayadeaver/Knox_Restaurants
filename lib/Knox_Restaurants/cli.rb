class KnoxRestaurants::CLI
    #outputs to user

    def call
      KnoxRestaurants::API.fetch #fetches from API
        puts "Welcome to Knoxville!"
        start
    end

    def start 
        print_cuisines
        puts "What are you in the mood for?"

        input = ""
        puts "Enter 'end' to exit"
        input = gets.strip.downcase
          if input == "end"
            goodbye
          elsif input.to_i.between?(1, @cuisine.length)
            print_restaurants(input.to_i)
            puts "To find out more, enter the number for which restaurant you want" 
          else
            puts "I don't understand. Please pick another cuisine"
            sleep(5)
            start
          end
        print_details(input = gets.to_i)
        puts "Would you like to pick another cuisine? Yes or No"
        if gets.chomp.downcase == "yes"
          start
        else
          goodbye
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
      r = @restaurant[input-1]
      
      puts <<~RESTAURANT
        Address: #{r.address}
        Phone number: #{r.phone_number}
        Website: #{r.url}
        Rating: #{r.rating} of 5
        Price Range: #{r.price}
        Reviews: #{r.reviews}
        RESTAURANT
      
    end

    def goodbye
      puts "Thanks for visiting Knoxville. Have a nice day."
      exit
    end
end
