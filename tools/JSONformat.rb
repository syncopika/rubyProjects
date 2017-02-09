=begin

	reformat json 
	this time I want to go in the opposite direction of formatArray.rb ^^
  
	i.e.
	[{"blah": "blah", "one": "two"}]
	
	to
	
	[
		{
		"blah": "blah",
		"one": "two"
		}
	]
	
=end

fileToEdit = ARGV[0]

if(fileToEdit.nil?)
	abort("No file supplied. terminating")
end

# open the file to read
file = File.open(fileToEdit, "r")

# open a new file to write in
periodIndex = fileToEdit.index('.') - 1
newFile = File.open(fileToEdit[0..periodIndex] + "_formatted.json", "w")

counter = 0
file.readlines.each do |line|

	# print out closing and opening array brackets
	if(line.include?("[") || line.include?("]"))
		newFile.puts line
	
	# if curly brace is found
	elsif (line.include?("{"))
		line.each_char do |char|
		
			if(char == '{')
				newFile.puts "	" + char
				
				#indent new line
				newFile.print "		"  
				
			elsif(char == '}')
				newFile.puts 
				newFile.puts "	" + char
			elsif(char == ',')
				
				#comma signals end of one key-value pair
				#using puts appends a newline!!
				newFile.puts char 
				
				#indent new line
				newFile.print "		"  
			
			else
				newFile.print char
			end	
			
		end
	end
end

file.close
newFile.close

print "done!"
