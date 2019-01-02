
require_relative "./my_regex"

FILE_NAME = 'temp.txt'
DELIMITER = "=" * 20

file = open(FILE_NAME)
  text = file.read
file.close

CONTRACTS_ARRAY =
    ["Hughes Missile Systems Company, Tucson, Arizona, is being awarded a
$7,311,983 modification to a firm fixed price contract for the FY94 TOW missile
production buy, total 368 TOW 2Bs. Work will be performed in Tucson, Arizona,
and is expected to be completed by April 30, 1996. Of the total contract funds,
$7,311,983 will expire at the end of the current fiscal year. This is a sole
source contract initiated on January 14, 1991. The contracting activity is the
U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-92-C-0260).",
     "Conventional Munitions Systems, Incorporated, Tampa, Florida, is being
awarded a $6,952,821 modification to a firm fixed price contract for Dragon
Safety Circuits Installation and retrofit of Dragon I Missiles with Dragon II
Warheads. Work will be performed in Woodberry, Arkansas (90%), and Titusville,
Florida (10%), and is expected to be completed by May 31, 1996. Contract funds
will not expire at the end of the current fiscal year. This is a sole source
contract initiated on May 2, 1994. The contracting activity is the U.S. Army
Missile Command, Redstone Arsenal, Alabama (DAAH01-94-C-S076)."]

puts "Original text"
puts DELIMITER
puts text

puts "Remove blank lines"
puts DELIMITER
text = MyRegex.strip_blank_lines(text)
puts text

puts "Remove leading blanks"
puts DELIMITER
text = MyRegex.strip_leading_blanks(text)
puts text

puts "Remove footnotes"
puts DELIMITER
text = MyRegex.strip_footnotes(text)
puts text

puts "Remove leading column"
puts DELIMITER
text = MyRegex.strip_leading_column(text)
puts text

puts "Find contract costs"
puts DELIMITER
CONTRACTS_ARRAY.each_with_index do |c, i|
  print "\tContract \##{i+1}: "
  MyRegex.find_sorted_dates(c).each do |d|
    print "#{d}, "
  end
  puts "#{MyRegex.find_costs(c)}"
end
