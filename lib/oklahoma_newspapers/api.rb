class API 
    #make calls to our api 

    def self.fetch_newspapers
        url = "https://chroniclingamerica.loc.gov/search/titles/results/?terms=oklahoma&format=json&page=4&limit=10"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        newspapers_hash = JSON.parse(response)
        array = newspapers_hash["items"] #accesses an array containing all newspapers 
        
        
        array.each do |paper|
            #initialize a new newspaper and assign attributes 
            instance = Newspaper.new 

            
            instance.name = paper["title"]
            instance.location = paper["place_of_publication"]
            instance.first_year = paper["start_year"]
            instance.last_year = paper["end_year"]
            instance.frequency = paper["frequency"]
        end  
        
        #name => "title"
        #location => "place_of_publicaiton"
        #first year of publication => "start_year"
        #last year of publication => "end_year"
        #frequency => "frequency

    end 
end 