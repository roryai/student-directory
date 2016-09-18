require 'csv'

@students = []

def try_load_students
    # ARGV.first takes the first agrument passed to the command line, eg. "buy directory.rb students.csv"
    filename=ARGV.first
  if filename.nil?
    # Defaults to students.csv
    filename="students.csv"
  end
  if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} entries from #{filename}."
  else
      # Filenot found error messages. Program continues to interactive menu.
      if filename == "students.csv"
          puts "'students.csv' not found"
      else
          puts "Sorry, #{filename} doesn't exist."
      end
  end
end

###############################################################################
def interactive_menu
    loop do
        print_menu
        method_selector(STDIN.gets.chomp)
    end
end

###############################################################################
def print_menu
    puts "\nWhat would you like to do?"
    puts "\n1. Input students."
    puts "\n2. Print list of students."
    puts "\n3. Save student data to file."
    puts "\n4. Load student data from a file."
    puts "\n5. Print students from a single cohort."
    puts "\n6. Print source code of this program."
    puts "\n7. Print students beginning with letter __."
    puts "\n9. Exit program."
end

###############################################################################
def method_selector selection
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            print "Press enter to save to 'students.csv', or save file as:"
            save_students STDIN.gets.chomp
        when "4"
            puts "Load data from which file?"
            load_students STDIN.gets.chomp
        when "5"
            print_selected_cohort @students
        when "6"
            output_source_code
        when "7"
            print_by_student_letter
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
        # Passes name to getter, getter takes other info and puts it into @students
        student_info_getter(name)
        # Asks user if input is correct, returns info on how many students are enrolled.
        info_checker
        # Takes name of next student once prev student added to @students
        name=STDIN.gets.chomp
    end
end

###############################################################################
# This method takes the hobby and cohort info
def student_info_getter(name)
    
      puts "\nWhat is the student's favourite hobby?"
      hobby=STDIN.gets.chomp
        if hobby==""
          hobby="<empty>"
        end
        
      puts "\nWhich cohort is the student enrolling in?"
      cohort=STDIN.gets.chomp
        if cohort==""
          cohort="<empty>"
        end
        cohort=cohort.to_sym
    # Name, hobby and cohort put into a new hash.      
      @students << {name: name, hobby: hobby, cohort: cohort}
      
   
end

###############################################################################
 # Checks to see if typo was made on last entry. Deletes it if so and returns user to menu loop.
def info_checker
  puts "\nIs this information correct?"
      puts @students.last
      puts "\nIf not, enter any character followed by enter and then retype the information. If the information is correct, just press enter"
      typo=STDIN.gets.chomp
     
        if typo!=""
            @students.pop
            puts "\nStudent information not added to directory."
        else
            puts "\nStudent information successfully added to directory."
        end
     
        if @students.length==1
            puts "\nWe now have 1 student enrolled."
        else
            puts "\nWe now have #{@students.length} students enrolled."
        end
      puts "\nEnter the name of the next student to be enrolled:"
end

###############################################################################
def show_students
        puts "\nThe students of Villains Academy\n----------------------------"
        puts_students @students
        puts "\nOverall we have #{@students.count} great students."
end


###############################################################################
# This method prints the student name and cohort is a numbered list.
def puts_students students
    if students.length > 0
 #       puts "\nPrint students beginning with the letter:"
 #       letter=STDIN.gets.chomp
        students.each_with_index do |name,name_index|
  #          if name[:name][0].downcase==letter.downcase
                puts "#{name_index+1}. #{name[:name].ljust(30)}, (#{name[:cohort].to_s.ljust(15)} cohort.)     Hobby: #{name[:hobby]}."
  #          end
        end
    end
end


###############################################################################
def print_by_student_letter
    puts "\nPrint students beginning with the letter:"
    letter=STDIN.gets.chomp
    @students.each_with_index do |name,name_index|
        if name[:name][0].downcase==letter.downcase
        puts "#{name_index+1}. #{name[:name].ljust(30)}, (#{name[:cohort].to_s.ljust(15)} cohort.)     Hobby: #{name[:hobby]}." 
        end
    end
end
###############################################################################
def save_students(filename)
    if filename == ""
        filename = "students.csv"
    end
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
            csv << [student[:name], student[:hobby], student[:cohort]]
        end
    end
    STDOUT.puts "Data successfully saved to #{filename}"
end

###############################################################################
def load_students(filename)
    if !File.exists?(filename)
     puts "\nNo such file. Please try again."
     return
    end
    @students = []
   File.open filename, "r" do |file|
       file.readlines.each do |line|
           name, hobby, cohort = line.chomp.split(',')
           @students << {name: name, hobby: hobby, cohort: cohort.to_sym}
       end
   end
   STDOUT.puts "#{@students.count} entries successfully loaded from #{filename}"
end

###############################################################################
def print_selected_cohort students
    puts "Which cohort would you like to print?"
    selection=STDIN.gets.chomp
    cohort_checker selection
    # if cohort_checker selection === "sdfgsdfgsdfg"
    #     puts "No students in that cohort in directory"
    # end
end

###############################################################################
def cohort_checker selection
@students.each do |hash| if hash[:cohort].to_s == selection
        puts "Name: #{hash[:name].to_s.ljust(20)} Cohort: #{hash[:cohort]}"
        end
    end
end
###############################################################################
def output_source_code
    File.open __FILE__, "r" do |file|
       file.readlines.each do |line|
           puts line
       end
   end
end
###############################################################################
# This begins the program
try_load_students
interactive_menu