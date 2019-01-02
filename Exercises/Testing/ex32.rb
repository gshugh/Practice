# noinspection RubyUnusedLocalVariable
the_count = [1, 2, 3, 4, 5]
fruits = %w(apples oranges pears apricots)
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

(0..change.size/2-1).each do |i|
  puts "Coins: #{change[2*i+1]}"
end
