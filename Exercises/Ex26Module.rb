module Ex26Module

  # This function will break up words for us.
  def Ex26Module.break_words(stuff)
#    words = stuff.split(' ')
    stuff.split(' ')
  end

  # Sorts the words.
  def Ex26Module.sort_words(words)
    words.sort
  end

  # Prints the first word after popping it off.
  def Ex26Module.print_first_word(words)
    word = words.shift
    puts word
  end

  # Prints the last word after popping it off.
  def Ex26Module.print_last_word(words)
    word = words.pop
    puts word
  end

  # Takes in a full sentence and returns the sorted words.
  def Ex26Module.sort_sentence(sentence)
    words = break_words(sentence)
    return sort_words(words)
  end

  # Prints the first and last words of the sentence.
  def Ex26Module.print_first_and_last(sentence)
    words = break_words(sentence)
    print_first_word(words)
    print_last_word(words)
  end

  # Sorts the words then prints the first and last one.
  def Ex26Module.print_first_and_last_sorted(sentence)
    words = sort_sentence(sentence)
    print_first_word(words)
    print_last_word(words)
  end



  puts "Let's practice everything."
  puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs.'

  # noinspection RubyUnusedLocalVariable
  poem = <<END
  \tThe lovely world
  with logic so firmly planted
  cannot discern \n the needs of love
  nor comprehend passion from intuition
  and requires an explanation
  \n\t\twhere there is none.
END

end