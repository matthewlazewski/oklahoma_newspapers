class Newspaper

    attr_accessor :name, :location, :first_year, :last_year, :frequency 
    @@all = []
    def initialize
        @@all << self 
        @name = name 
        @location = location
        @first_year = first_year 
        @last_year = last_year
        @frequency = frequency 
    end  
    
    def self.all 
        @@all 
    end
    
    def self.paper_length_array
        length = @@all.last_year.to_i - @@all.first_year.to_i 
        length 
    end
end 