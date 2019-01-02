
print "Enter file to be written to: "
filename = $stdin.gets.chomp

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

puts "Opening the file..."
file = open(filename, 'a')

#puts "Truncating the file.  Goodbye!"
#file.truncate(0)

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

file.write("#{line1}\n"\
             "#{line2}\n"\
             "#{line3}\n")

puts "And finally, we close it."
file.close
