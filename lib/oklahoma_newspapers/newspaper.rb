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
    
    # def self.search 
    #     choice = self.all.find{ |paper| paper }
    #     if input == choice.name 
    #         return choice 
    #     else 
    #         puts "Invalid search. Please try again."
    #     end
    # end 

end 