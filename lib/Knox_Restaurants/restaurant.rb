class KnoxRestaurants::Restaurant 
    attr_accessor :name, :cuisine, :address, :phone_number
    
    @@all = []

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

    def cuisines
        self.all.collect{|restaurant| puts restaurant.cuisine}

    end

    
end