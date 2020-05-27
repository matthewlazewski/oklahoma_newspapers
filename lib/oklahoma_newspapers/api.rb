class API 
    #make calls to our api 

    def self.fetch_newspapers
        url = "https://chroniclingamerica.loc.gov/search/titles/results/?terms=oklahoma&format=json"
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
    end 
end 