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

    def self.print_cuisines #prints all cuisines but only unique items
        puts self.all.collect{|r| r.cuisine}.flatten.uniq
        
      end
    
end