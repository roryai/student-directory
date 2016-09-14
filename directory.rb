students=[ 
           {name: "Dr. Hannibal Lecter",            cohort: :november},
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

# This method has a parameter placeholder name that is then passed to the iterator
# that takes each element in whatever array is passed to it, assigns it to the
# placeholder name, then it executes the code block between do and end, which
# in this case puts it to the screen.
def puts_students name
    name.each do |name|
      puts "#{name[:name]} (#{name[:cohort]} cohort)"
    end

def put_footer student
    puts "Overall we have #{student.count} great students."
end

# Output methods called below
put_header
puts_students students
put_footer students