class CLI

    def start
        puts    "         ,,,         "
        puts    "        (o o)        "
        puts    "----oOO--( )--OOo----"
        puts "Welcome to 'A Brief History of Oklahoma Newspapers! Your Number One Source for Random Facts About Newspapers You've Probably Never Heard Of!"
        API.fetch_newspapers
        self.homepage
    end
    
    def homepage
        sleep(1)
        puts "\nWould you like to see a list of newspapers?"
        puts "\nType 'yes' to browse publications or 'more options' to see what else you can do."
        puts "\nType exit anywhere in the program to return to the home page."
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
            puts "Goodbye! Come back soon!"
        end 
    
    end 

    def display_newspapers
        Newspaper.all.each.with_index(1) do |paper, index|
            puts "#{index}. #{paper.name}"
        end 
        puts "Please select the number of the publication you wish to view."
    end 

    def ask_for_selection
        input = gets.chomp.to_i - 1

        until input.between?(0, Newspaper.all.length - 1) 
            puts "Invalid selection. Please enter a valid number."
            index = gets.strip.to_i - 1 
        end 

        selection = Newspaper.all[input]
        
        display_info(selection)
       
    end 

    def more_options
        puts "Select the number for the option you wish to see."
        puts "\n 1. List Publications that are Still Being Published"
        puts "\n 2. List in Order of Year of First Publication"
        puts "\n 3. Search for Publication"
        puts "\n 4. List Daily Publications"
        puts "\n 5. Return To Homepage"

        
        input = gets.chomp.to_i
        if input == 1
            list_current
        elsif input == 2 
            old_to_young 
        elsif input == 3
            search_newspapers
        elsif input == 4 
            list_daily
        elsif input == 5 
        
        else 
            puts "\n Please enter valid number"
            sleep(1)
            more_options
        end 
    end 

    def display_list_view(newpaper_collection)
        newpaper_collection.each do |paper| 
            puts "\n"
            puts paper.name 
        end  
    end 

    def list_current
        current = Newspaper.all.find_all { |paper| paper.last_year == 9999 }
        display_list_view(current)
    end 

    def list_daily
        daily = Newspaper.all.find_all { |paper| paper.frequency == "Daily" }
        display_list_view(daily) 
    end 

    def old_to_young
        sorted = Newspaper.all.sort {|a,b| a.first_year <=> b.first_year}
        sorted.each { |x| puts "\n#{x.name} #{x.first_year}" }  
        sorted 
        puts "\n"
    end 
         

    def search_newspapers
        puts "Enter the name of the publication: "
        input = gets.strip.downcase.to_s

        
        
        search_result = Newspaper.search(input)
        if  search_result != nil 
            puts "\n" 
            display_info(search_result)
        else 
            puts "Invalid search. Please try again or type 'exit' to return to homepage."
            search_newspapers
            input == "exit" ? homepage : homepage
        end
 
        
        # if  Newspaper.all.find { |paper| input == paper.name.downcase } 
        #     display_info(paper)
        # elsif input == "exit"
        #     homepage 
        # else 
        #     puts "Invalid search. Please try again."
        #     puts "\n"
        # end 

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



