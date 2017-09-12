require 'io/console'
require 'yaml'

$data = YAML.load_file('../data/log.yaml')

###Creates list of programs using yaml keys###
key_list = Array.new
value_list = Array.new

$data.each_pair do |key, value| 
key_list.push(key) 
value_list.push(value)  
end

###Gets log file from yaml###
def choose_log(choice)
	$data.each_pair { |key, value| $result = value if key == choice }
	puts $result
end

###Press any key to continue method###
def continue
	puts "Press any key to continue..."
	STDIN.getch
  print "\r"
  puts "------------------------------"
end

###Check if the log file exists for display###
def file_check(log)
	File.file?(log)
end

###Program Loop###
while true
puts "Which log do you want to tail?:"
puts "-----LOG LIST-----"

###Checking if file exists###
$data.each_pair do |key, value|
	if file_check(value) == true
		puts "#{key.capitalize} Log"
	end
end

print ": "#Making it look prettier by the day

###Checks if command is valid###
choice = gets.chomp.downcase
	until key_list.include? choice
		if choice == "q"
			abort("BYE")
		else
			puts "Please type that correctly"
			choice = gets.chomp.downcase
		end
	end

###Executing based on choice###	
choose_log(choice)
system("tail #{$result}")

continue
end
###End of Loop###
