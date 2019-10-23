class KnoxRestaurants::CLI
    #outputs to user

    def call
      KnoxRestaurants::API.fetch #fetches from API
      puts <<-REST
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      |     Welcome to Knoxville!     |
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      REST
      start
    end

    def start 
        display_cuisine_choices
        input_cuisine_choice
        return_details
        last_hurrah
    end

    def display_cuisine_choices
      @cuisine = KnoxRestaurants::Restaurant.get_cuisines.each.with_index(1) do |cuisine, idx|
        puts <<-REST
        #{idx}. #{cuisine}  
        REST
      end
    end

    def input_cuisine_choice
      puts <<-REST
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      |     What are you in the mood for?     |
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      REST
      puts <<-REST
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      |     Enter a valid number     |
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      REST
      puts <<-REST
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      |     Enter 'end' to exit     |
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      REST
      input = gets.strip.downcase
        if  valid?(input, @cuisine)
          display_restaurants(input.to_i)
          puts <<-REST
          -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
          |         To find out more, enter the        |
          |     number for the restaurant you want     |
          -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
          REST
        else
          puts <<-REST
          -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
          |     I don't understand. Please pick another cuisine     |
          -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
          REST
          sleep(2)
          start
        end
    end

    def display_restaurants(input)
      @restaurant = KnoxRestaurants::Restaurant.get_cuisine_restaurants(input).each.with_index(1) do |r, idx|
        puts <<-REST
        #{idx}. #{r.name}  
        REST
       end
    end

    def return_details
      puts <<-REST
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      |     Please enter a valid restaurant number     |
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      REST
      restaurant = gets.chomp
        if valid?(restaurant, @restaurant)
          display_details(restaurant.to_i)
        else
          return_details
        end
    end

    def display_details(input)
      r = @restaurant[input-1]
      
      puts <<-REST
      Address: #{r.address}
      Phone number: #{r.phone_number}
      Rating: #{r.rating} of 5
      Price Range: #{r.price}
      Reviews: #{r.reviews}
      Website: #{r.url}
      REST
    end

    def valid?(input,array)
      if input == "end"
        goodbye
      end
       input.to_i.between?(1, array.length)
    end

    def last_hurrah
      puts <<-REST
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      |     Would you like to pick another cuisine? Yes or No     |
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      REST
        if gets.chomp.downcase == "yes"
          start
        else
          goodbye
        end
    end

    def goodbye
      puts <<-REST
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      |     Thanks for visiting Knoxville. Have a nice day!     |
      -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-
      REST
      exit
    end
end