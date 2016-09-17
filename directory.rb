@students = []

def try_load_students
   filename=ARGV.first
   return if filename.nil?
   if File.exists?(filename)
       load_students(filename)
       puts "Loaded #{@students.count} entries from #{filename}."
   else
       puts "Sorry, #{filename} doesn't exist."
       exit
   end
end

###############################################################################
def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

###############################################################################
def print_menu
    puts "\nWhat would you like to do?"
    puts "\n1. Input students."
    puts "\n2. Print list of students."
    puts "\n3. Save student data to 'students.csv'"
    puts "\n4. Load student data from 'students.csv'"
    puts "\n9. Exit program."
end

###############################################################################
def process selection
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            load_students
        when "9"
            abort("\nUser exited the program\n ")
        else 
            puts "\nInvalid input, try again."
    end
end

###############################################################################
#This method asks the user for input and adds it to the student array.
def input_students
   puts "\nHello, and welcome to Villains Academy"
   puts "\nPlease enter the names of all the Villains who will be enrolling this semester"
   puts "\nWhen you've entered each name, press Enter. To finish, enter a blank line"
   # Alternatives to .chomp are .tr(\n), .chop, .chop(\n), .strip
   name=STDIN.gets.chomp
   
    while !name.empty? do
    # This section takes the hobby and cohort info
      puts "\nWhat is the student's favourite hobby?"
      hobby=STDIN.gets.chomp
        if hobby==""
          hobby="<empty>"
        end
      puts "\nWhich cohort is the student enrolling in?"
      cohort=STDIN.gets.chomp
      cohort=cohort.to_sym
        if cohort==""
          cohort="<empty>"
        end
    # Name, hobby and cohort put into a new hash.      
      @students << {name: name, hobby: hobby, cohort: cohort}
      
    # Checks to see if typo was made on last entry. Deletes it if so and returns user to start of program.  
      puts "\nIs this information correct?"
      puts @students.last
      puts "\nIf not, enter any character followed by enter and then retype the information. If the information is correct, just press enter"
      typo=STDIN.gets.chomp
     
        if typo!=""
            @students.pop
        end
     
        if @students.length==1
            puts "\nWe now have 1 student enrolled."
        else
            puts "\nWe now have #{@students.length} students enrolled."
        end
      puts "\nEnter the name of the next student to be enrolled:"
      name=STDIN.gets.chomp
    end
end

###############################################################################
def show_students
        put_header
        puts_students @students
        put_footer
end

###############################################################################
def put_header
    puts "\nThe students of Villains Academy\n-----------------"
end

###############################################################################
# This method prints the student name and cohort is a numbered list.
def puts_students students
    if students.length > 0
        puts "\nPrint students beginning with the letter:"
        letter=STDIN.gets.chomp
        students.each_with_index do |name,name_index|
            if name[:name][0].downcase==letter.downcase
                puts "#{name_index+1}. #{name[:name].ljust(30)}, (#{name[:cohort].to_s.ljust(15)} cohort.)     Hobby: #{name[:hobby]}."
            end
        end
    end
end

def put_footer
    puts "\nOverall we have #{@students.count} great students."
end

###############################################################################
def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data=[student[:name],student[:hobby], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

###############################################################################
def load_students(filename = "students.csv")
   file = File.open(filename, "r")
   file.readlines.each do |line|
       name, hobby, cohort = line.chomp.split(',')
       @students << {name: name, hobby: hobby, cohort: cohort.to_sym}
   end
   file.close
end

###############################################################################
def print_selected_cohort students
    selection=STDIN.gets.chomp
 students.map do |hash| if hash[:cohort] == selection.to_sym
        puts "Name: #{hash[:name].to_s.ljust(32)} Cohort: #{hash[:cohort]}"
        end
    end
end


# This begins the program
try_load_students
interactive_menu





# Code below saved for possible later use
#students= [{name: "Dr. Hannibal Lecter",            cohort: :november},
#           {name: "Darth Vader",                    cohort: :november},
#           {name: "Nurse Ratched",                  cohort: :november},
#           {name: "Michael Corleone",               cohort: :november},
#           {name: "Alex DeLarge",                   cohort: :november},
#           {name: "The Wicked Witch of the West",   cohort: :november},
#           {name: "Terminator",                     cohort: :november},
#           {name: "Freddie Kruger",                 cohort: :november},
#           {name: "The Joker",                      cohort: :november},
#           {name: "Joffrey Baratheon",              cohort: :november},
#           {name: "Norman Bates",                   cohort: :november}
#           ]

            # puts "#{student_list[counter][0]}. #{student_list[0][0]}, (#{student_list[0][:cohort]} cohort)"


# This method takes the information passed to it (the student array), and passes it
# into the each_with_Index iterator, which gives a way to access the array index info
# within the iterator. Not possible to do this otherwise. Each entry in the array
# is then accessed and has it's position + 1, name, and cohort key and value added
# into the string, which is then putsed.