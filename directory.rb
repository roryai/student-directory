#This method asks the user for input and adds it to the student array.
def input_students
   puts "Hello, and welcome to Villains Academy"
   puts "Please enter the names of all the Villains who will be enrolling this semester"
   puts "When you've entered each name, press Enter. To finish, enter a blank line"
   students=[]
   # Alternatives to .chomp are .tr(\n), .chop, .chop(\n), .strip
   name=gets.chomp
   
    while !name.empty? do
    # This section takes the hobby and cohort info
      puts "What is the student's favourite hobby?"
      hobby=gets.chomp
        if hobby==""
          hobby="<empty>"
        end
      puts "Which cohort is the student enrolling in?"
      cohort=gets.chomp
      cohort=cohort.to_sym
        if cohort==""
          cohort="<empty>"
        end
    # Name, hobby and cohort put into a new hash.      
      students << {name: name, hobby: hobby, cohort: cohort}
      
    # Checks to see if typo was made on last entry. Deletes it if so and returns user to start of program.  
      puts "Is this information correct?"
      puts students.last
      puts "If not, enter any character followed by enter and then retype the information. If the information is correct, just press enter"
      typo=gets.chomp
     
        if typo!=""
            students.pop
        end
      
        if students.length==1
            puts "We now have 1 student enrolled."
        else
            puts "We now have #{students.length} students enrolled."
        end
      puts "Enter the name of the next student to be enrolled:"
      name=gets.chomp
    end
   students
end

# This method prints the student name and cohort is a numbered list.
def puts_students(student_list)
    if student_list.length > 0
        puts "Print students beginning with the letter:"
        letter=gets.chomp
        student_list.each_with_index do |name,name_index|
            if name[:name][0].downcase==letter.downcase
                puts "#{name_index+1}. #{name[:name].ljust(30)}, (#{name[:cohort].to_s.ljust(15)} cohort.)     Hobby: #{name[:hobby]}."
            end
        end
    end
end

def put_header
    puts "The students of Villains Academy\n-----------------"
end

def put_footer student
    puts "Overall we have #{student.count} great students."
end


# This is the input method
students=input_students
# Output methods called below
put_header
puts_students students
put_footer students



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