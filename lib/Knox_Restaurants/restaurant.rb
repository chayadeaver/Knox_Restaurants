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

    def self.get_cuisines #prints all cuisines but only unique items
        self.all.collect{|r| r.cuisine}.flatten.uniq
    end

    def self.get_names
        self.all.collect{|r| r.name}
    end

    def self.get_phone_numbers
        self.all.collect{|r| r.phone_number}
    end

    def self.get_address
        self.all.collect{|r| r.address}
    end

    def self.get_cuisine_restaurants(num)
      cuisine = self.get_cuisines[num-1]
      self.all.select {|restaurant| restaurant.cuisine.include?(cuisine)}

    end
end
