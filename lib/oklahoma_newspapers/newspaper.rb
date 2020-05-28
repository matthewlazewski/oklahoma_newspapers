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
    
    def self.search(input)
        self.all.find{ |i| input ==  i.name.downcase }
    end 

end 