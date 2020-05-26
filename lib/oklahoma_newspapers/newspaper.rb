class Newspaper

    attr_accessor :name, :location, :first_year, :last_year, :frequency 
    @@all = []
    def initialize
        @@all << self 
    end  
    
    def self.all 
        @@all 
    end 
    
    
    #name => "title"
    #location => "place_of_publicaiton"
    #first year of publication => "start_year"
    #last year of publication => "end_year"
    #frequency => "frequency"



end 