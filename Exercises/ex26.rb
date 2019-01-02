
require "./ex26Module"

sentence = "All good things come to those who wait."
words = Ex26Module.break_words(sentence)
puts words
sorted_words = Ex26Module.sort_words(words)
puts sorted_words
Ex26Module.print_first_word(words)
Ex26Module.print_last_word(words)
puts words
Ex26Module.print_first_word(sorted_words)
Ex26Module.print_last_word(sorted_words)
puts sorted_words
sorted_words = Ex26Module.sort_sentence(sentence)
puts sorted_words
Ex26Module.print_first_and_last(sentence)
Ex26Module.print_first_and_last_sorted(sentence)