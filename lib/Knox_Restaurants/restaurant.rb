class KnoxRestaurants::Restaurant
    attr_accessor :name, :cuisine, :address, :phone_number, :url, :rating, :price

    @@all = []

    #a restaurant has a name, a list of cuisines, an address, and a phone number

    def initialize(restaurant_hash)
        @name = restaurant_hash[:name]
        @phone_number = restaurant_hash[:phone_number]
        @cuisine = restaurant_hash[:cuisine]
        @address = restaurant_hash[:address]
        @url = restaurant_hash[:url]
        @rating = restaurant_hash[:rating]
        @price = restaurant_hash[:price]
        @@all << self
    end

    def self.all
        @@all
    end

    def self.get_cuisines #prints all cuisines but only unique items
        self.all.collect{|r| r.cuisine}.flatten.uniq
    end

    def self.get_cuisine_restaurants(num)
      cuisine = self.get_cuisines[num-1]
      rest = self.all.select {|r| r.cuisine.include?(cuisine)}
      
    end
end
