class CLI

    def start 
        puts "Welcome to 'A History of Oklahoma Newspapers'"
        API.fetch_newspapers
        self.homepage
    end
    
    def homepage
        puts "Would you like to see a list of newspapers?"
        puts "Type 'yes' to browse publications or 'more options' to see what else you can do."
        puts "Type exit anywhere in the program to return to this page."
        user_input = gets.chomp.downcase 

        if user_input == "yes" || user_input == "y"
            display_newspapers
            ask_for_selection
            sleep(1)
            homepage
        elsif user_input == "more options"
            more_options
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

    def more_options
        puts "Select the number for the option you wish to see."
        puts "\n 1. List Publications that are Still Being Published"
        puts "\n 2. List in Order of Year of First Publication"
        puts "\n 3. Search for Publication"
        puts "\n 4. Return To Homepage"
        
        input = gets.chomp.to_i
        if input == 1
            list_current
        elsif input == 2 
            old_to_young 
        elsif input == 3
            search_newspapers
        elsif input == 4 
            homepage
        else 
            puts "\n Please enter valid number"
            sleep(1)
            more_options
        end 
    end 

    def list_current
        Newspaper.all.map do |paper| 
            if paper.last_year == 9999 
                puts paper.name 
            end 
        end 
    end 

    def old_to_young
       sorted = Newspaper.all.sort { |a,b| a.first_year <=> b.first_year }
       puts sorted.each { |paper| paper.name }
    end

    def search_newspapers
        puts "Enter the name of the publication: "
        input = gets.chomp.downcase
        
        if input == Newspaper.all.each { |paper| paper.name.downcase } 
            display_info(paper)
        elsif input == "exit"
            homepage 
        else 
            puts "Invalid search. Please try again."
            puts "\n"
        end 

    end 

    def display_info(newspaper_choice)
        puts "\n"
        puts "Name: " + newspaper_choice.name
        puts "\n"
        puts "Location: " + newspaper_choice.location
        puts "\n"
        puts "Frequency: " + newspaper_choice.frequency 
        puts "\n"
        puts "First Year of Publication: " + newspaper_choice.first_year.to_s
        puts "\n"
        
        if newspaper_choice.last_year == 9999
            puts "Last Year of Publication: Current"
        else 
            puts "Last Year of Publication: " + newspaper_choice.last_year.to_s 
        end 
        puts "\n"
    end  
end 



