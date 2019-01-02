
file_name1 = ARGV.first
file1 = open(file_name1)

puts "Here's your file #{file_name1}: "
print file1.read

file1.close

print "Type the filename again: "
file_name2 = $stdin.gets.chomp

file2 = open(file_name2)

print file2.read

file2.close