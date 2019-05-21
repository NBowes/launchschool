# Method takes sentence as an argument
# Change all number words to digits, leave everything else the same
# Return new string with number digits


def word_digits(sentence)
  digits = {1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
    6 => 'six', 7 => 'seven', 8 => 'eight', 9 =>'nine', 0 => 'zero'
  }
  sentence.split.map do |word|
    if digits.values.include?(word)
      digits.key(word)
    else
      word
    end
  end.join(' ')
end

p word_digits('I live at four two one Mt Belcher')

# format a phone number
def words_to_digit(phrase)
  digits = {'1' => 'one', '2' => 'two', '3' => 'three', '4' => 'four', '5'=> 'five',
    '6' => 'six', '7' => 'seven', '8' => 'eight', '9' =>'nine', '0' => 'zero'
  }
  numbers = %w[1 2 3 4 5 6 7 8 9 0]

  digits.values.each do |word_digit|
    phrase.gsub!(word_digit, digits.key(word_digit))
    phrase.gsub!(/\d\s/, digits.key(word_digit))
  end
  phrase
end

p words_to_digit('My number is six one three four zero six six eight eight seven.')