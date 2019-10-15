class KnoxRestaurants::CLI
    #outputs to user
    def call
        puts "Welcome to Knoxville!"
        start
        KnoxRestaurants::Scraper.fetch_data

    end

    def start
     puts "What are you in the mood for?"
     puts <<~TYPE
     1. Breakfast
     2. Burgers
     3. Dive
     4. Italian
     5. Mexican
     6. French
     7. Farm-to-table
     8. Thai
     9. Vegetarian
     10. Southern/soul food
     11. Wine Bar 
     12. Casual Dining
     13. Seafood

     TYPE
    #  input = gets.chomp

    end

end