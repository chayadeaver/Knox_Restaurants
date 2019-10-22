class KnoxRestaurants::CLI
    #outputs to user

    def call
      KnoxRestaurants::API.fetch #fetches from API
        puts "Welcome to Knoxville!"
        start
    end

    def start 
        print_cuisines
        input_cuisine_number
        return_details
        last_hurrah
    end

    def return_details
      puts "Please enter a valid restaurant number"
      restaurant = gets.chomp
        if valid?(restaurant, @restaurant)
          print_details(restaurant.to_i)
        else
          return_details
        end
    end

    def input_cuisine_number
      puts "What are you in the mood for?"
      puts "Enter 'end' to exit"
      input = gets.strip.downcase
        if  valid?(input, @cuisine)
          print_restaurants(input.to_i)
          puts "To find out more, enter the number for which restaurant you want"
        else
          puts "I don't understand. Please pick another cuisine"
          sleep(2)
          start
        end
    end

    def valid?(input,array)
      if input == "end"
        goodbye
      end
      # input_to_i.between?(1,array.length)
       input.to_i.between?(1, array.length)
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

    def last_hurrah
      puts "Would you like to pick another cuisine? Yes or No"
        if gets.chomp.downcase == "yes"
          start
        else
          goodbye
        end
    end

    def goodbye
      puts "Thanks for visiting Knoxville. Have a nice day."
      exit
    end
end
