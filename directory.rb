

# Storing the students in an array allows us to easily use the entries for
# multiple purposes
students=[ "Dr. Hannibal Lecter",
           "Darth Vader",
           "Nurse Ratched",
           "Michael Corleone",
           "Alex DeLarge",
           "The Wicked Witch of the West",
           "Terminator",
           "Freddie Kruger",
           "The Joker",
           "Joffrey Baratheon",
           "Norman Bates"
         ]

# This string covers 2 lines.
def put_header
    puts "The students of Villains Academy\n-----------------"
end

# This method has a parameter placeholder x that is then passed to the iterator
# that takes each element in whatever array is passed to it, assigns it to the
# placeholder y, then it executes the code block between do and end, which
# in this case puts it to the screen. 
def put_names x
    x.each do |y|
       puts y 
    end
end

def put_footer x
    puts "Overall we have #{x.count} great students."
end

put_header
put_names students
put_footer students