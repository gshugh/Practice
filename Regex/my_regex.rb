
require 'date'

module MyRegex

#  From the start of the line (^), find all patterns with 0 or more white
# spaces (\x*) followed by a carriage return. Replace with nothing.

  def MyRegex.strip_blank_lines(words)
    words.gsub(/^\s*\n/,"")
  end

#  From the start of the line (^), find all patterns with 1 or more white
# spaces (\s+). Replace with nothing.

  def MyRegex.strip_leading_blanks(words)
    words.gsub(/^\s+/,"")
  end

#  Anywhere in the string, find all patterns with "[", followed by 1 or more
# digits (\d+), followed by "]". Replace with nothing.

  def MyRegex.strip_footnotes(words)
    words.gsub(/\[\d+\]/,"")
  end

#  From the start of the line (^), find all patterns with 1 or more non-white
# space characters (\S+), followed by 1 or more white space characters
# (\s+). Replace with nothing.

  def MyRegex.strip_leading_column(words)
    words.gsub(/^\S+\s+/,"")
  end

#  Anywhere in the text, return all patterns that start with "$", followed by 1
# or more digits/commas ([\d,]+).

  def MyRegex.find_costs(words)
    words.match(/\$[\d,]+/)
  end

#  Anywhere in the text, return all patterns (scan)that start with a word (\w+),
# some number of spaces (\s+), a one or two digit number of 1-31
# ([0-2]\d?|[3][01]?), a comma followed by some number of spaces (,\s+), and
# ending with a 4 digit number (\d{4}).

  def MyRegex.find_sorted_dates(words)
    d = words.scan(/(\w+)\s+((\w+)\s+([0-2]\d?|[3][01]?),\s+(\d{4})),\s+(\d{4})/)
    temp ||= []
    d.each do |m|
      temp <<  Date.strptime("{#{m[2]}, #{m[0]}, #{m[1]} }", "{ %Y, %B, %d }")
    end
    temp.sort
  end

end