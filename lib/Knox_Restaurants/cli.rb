class KnoxRestaurants::CLI
    #outputs to user
    def call
        KnoxRestaurants::Scraper.fetch_data #fetches from API
        puts "Welcome to Knoxville!" 
        puts "What are you in the mood for?"
        print_cuisines

        input = ""
        while input != "end"
        puts "Enter 'end' to exit"
        input = gets.strip.downcase
          if input != "end"
            print_restaurants(input.to_i)
            puts "Still hungry? Pick another cuisine"
          elsif input  
          else
            exit
          end
        end 
    end

    def print_cuisines
      KnoxRestaurants::Restaurant.get_cuisines.each.with_index(1) do |cuisine, idx|
        puts "#{idx}. #{cuisine}"
      end
    end

    def print_restaurants(input)
      KnoxRestaurants::Restaurant.get_cuisine_restaurants(input).each.with_index(1) do |r, idx|
        puts <<~REST
        #{idx}. #{r.name}
        Address: #{r.address}
        Phone number: #{r.phone_number}
        Website: #{r.url}
        Rating: #{r.rating} of 5
        Price Range: #{r.price}
        Reviews: #{r.reviews}
        REST
      end
    end

    def exit
      puts "Thanks for visiting Knoxville. Have a nice day."
    end
end
