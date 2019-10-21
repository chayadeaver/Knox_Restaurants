class KnoxRestaurants::Restaurant
    attr_accessor :name, :cuisine, :address, :phone_number, :url, :rating, :price, :reviews

    @@all = []

    #a restaurant has a name, a list of cuisines, an address, a phone number
    #website, rating, price range, and reviews

    def initialize(restaurant_hash) 
        #instantiates a Restaurant object with a hash of attributes belong to each instance
        @name = restaurant_hash[:name]
        @phone_number = restaurant_hash[:phone_number]
        @cuisine = restaurant_hash[:cuisine]
        @address = restaurant_hash[:address]
        @url = restaurant_hash[:url]
        @rating = restaurant_hash[:rating]
        @price = restaurant_hash[:price]
        @reviews = restaurant_hash[:reviews]
        @@all << self
    end

    def self.all
        @@all
    end

    def self.get_cuisines 
        #displays a list of cuisines with no duplicates
        self.all.collect{|r| r.cuisine}.flatten.uniq
    end

    def self.get_cuisine_restaurants(num)
        #compares the user input as an integer to find the cuisine that matches the Restaurant instance
      cuisine = self.get_cuisines[num-1]
      rest = self.all.select {|r| r.cuisine.include?(cuisine)}
    end
end
