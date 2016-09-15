#This method asks the user for input and adds it to the student array.
# def input_students
#   puts "Hello, and welcome to Villains Academy"
#   puts "Please enter the names of all the Villains who will be enrolling this semester"
#   puts "When you've entered each name, press Enter. To finish, enter a blank line"
   
#   students=[]
   
#   name=gets.chomp
   
#     while !name.empty? do
#       students << {name: :name, cohort: :november}
#         if students.length==1
#             puts "We now have 1 student enrolled."
#         else
#             puts "We now have #{students.length} students enrolled."
#         end
#       name=gets.chomp
#     end
   
#   students
# end

students= [{name: "Dr. Hannibal Lecter",            cohort: :november},
           {name: "Darth Vader",                    cohort: :november},
           {name: "Nurse Ratched",                  cohort: :november},
           {name: "Michael Corleone",               cohort: :november},
           {name: "Alex DeLarge",                   cohort: :november},
           {name: "The Wicked Witch of the West",   cohort: :november},
           {name: "Terminator",                     cohort: :november},
           {name: "Freddie Kruger",                 cohort: :november},
           {name: "The Joker",                      cohort: :november},
           {name: "Joffrey Baratheon",              cohort: :november},
           {name: "Norman Bates",                   cohort: :november}
           ]
# This string covers 2 lines when putsed, saving space. 
def put_header
    puts "The students of Villains Academy\n-----------------"
end

# This method takes the information passed to it (the student array), and passes it
# into the each_with_Index iterator, which gives a way to access the array index info
# within the iterator. Not possible to do this otherwise. Each entry in the array
# is then accessed and has it's position + 1, name, and cohort key and value added
# into the string, which is then putsed.

def puts_students(student_list)
    puts "Print students beginning with the letter:"
    test_letter=gets.chomp
    puts "test letter is #{test_letter}"
    # if test_letter=""
    #     test_letter=student_list[0][:name][0]
    # end
    student_letter=student_list[0][:name][0]
    puts "student letter is #{student_letter}"
    counter=0
    
    while test_letter.downcase==student_letter.downcase do
    #&& student_list[:name].to_i.length<12 
            puts "#{student_list[counter][0]}. #{student_list[counter][:name]}, (#{student_list[counter][:cohort]} cohort.)"
            counter=counter+1
            until counter>student_list.length
        end
    end   
    
end

def put_footer student
    puts "Overall we have #{student.count} great students."
end


# This is the input method
# students=input_students
# Output methods called below
put_header
puts_students students
put_footer students



# Code below saved for possible later use
