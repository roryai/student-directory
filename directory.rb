

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

# This prevents us from having to manually update the student count
student_count=students.count

# This string covers 2 lines.
students_intro = "The students of Villains Academy\n-----------------"

# THis set of puts gives us a nice set of info on the students
puts students_intro
puts students[0..-1]
puts "\nOverall we have #{student_count} great students."