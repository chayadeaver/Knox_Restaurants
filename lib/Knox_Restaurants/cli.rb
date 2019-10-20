class KnoxRestaurants::CLI
    #outputs to user
    def call
        KnoxRestaurants::Scraper.fetch_data
        print_cuisines
        puts "Welcome to Knoxville!"
        puts "What are you in the mood for?"
        puts "Enter 'end' to exit"


        input = gets.chomp.downcase

        print_restaurants(input.to_i)




    end

    def print_cuisines
      KnoxRestaurants::Restaurant.get_cuisines.each.with_index(1) do |cuisine, idx|
        puts "#{idx}. #{cuisine}"
      end
    end

    def print_restaurants(input)
      KnoxRestaurants::Restaurant.get_cuisine_restaurants(input)
    end
end
