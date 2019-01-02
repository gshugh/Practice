print "How old are you in years? "
age = $stdin.gets.chomp.to_f
print "How tall are you in feet and inches? "
height = $stdin.gets.chomp
print "How much do you weigh in lbs? "
weight = $stdin.gets.chomp.to_f

puts "So, you're #{age} years old, #{height} tall and #{weight} lbs."
puts "You need to lose #{0.1*weight} lbs."