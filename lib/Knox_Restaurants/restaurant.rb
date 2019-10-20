class KnoxRestaurants::Restaurant 
    attr_accessor :name, :cuisine, :address, :phone_number
    
    @@all = []

    #a restaurant has a name, a list of cuisines, an address, and a phone number

    def initialize(restaurant_hash)
        @name = restaurant_hash[:name]
        @phone_number = restaurant_hash[:phone_number]
        @cuisine = restaurant_hash[:cuisine]
        @address = restaurant_hash[:address]
        @@all << self

    end
    
    def self.all
        @@all
    end

    def self.cuisines #displays all cuisinesn but only unique items
      i = self.all.collect{|rest| rest.cuisine}.flatten.uniq
      puts i
    end

    
end