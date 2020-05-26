class CLI
    #interact with the user 
    #any puts or get statements 
    #control the flow of our programs 

    def start 
        puts "Welcome"
        API.fetch_newspapers
        self.homepage
    end
    
    def homepage
        puts "Would you like to see a list of newspapers?"
        puts "Type yes to browse publications"
        user_input = gets.chomp.downcase 
        if user_input == "yes" || user_input == "y"
            display_newspapers
            ask_for_selection
            sleep(1)
            homepage
        else 
            #end the program
            puts "Goodbye! Come back soon!"
        end 
    end 

    def display_newspapers
        #access and print newspapers
        Newspaper.all.each.with_index(1) do |paper, index|
            puts "#{index}. #{paper.name}"
        end 
    end 

    def ask_for_selection
        #ask user for choice
        index = gets.chomp.to_i - 1

        until index.between?(0, Newspaper.all.length - 1) 
            puts "Invalid selection. Please enter a valid number."
            index = gets.strip.to_i - 1 
        end 

        selection = Newspaper.all[index]

        puts "Would you like to learn more?"
        user_input = gets.chomp.downcase
        if user_input == "yes" || user_input == "y"
            display_info(selection)
        else 
            puts "Goodbye. Come back soon!"
        end 
       
    end 

    def display_info(newspaper_choice)
        puts "Name:" + newspaper_choice.name
        puts "Location:" + newspaper_choice.location
        puts "Frequency:" + newspaper_choice.frequency 
        puts "First Year of Publication:" + newspaper_choice.first_year.to_s
        puts "Last Year of Publication:" + newspaper_choice.last_year.to_s
       

    end 
end 



