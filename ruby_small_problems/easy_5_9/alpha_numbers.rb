# write numbers in order based on the written number word

NUMBERS = %w[
  one
  two
  three
  four
  five
  six
  seven
  eight
  nine
  ten
  eleven
  twelve
  thirteen
  fourteen
  fifteen
  sixteen
  seventeen
  eighteen
  ninteen
].freeze

def alpha_numbers(numbers)
  numbers.sort_by { |num| NUMBERS[num] }
end

p alpha_numbers((0..19).to_a)

## alternate

NUMBERS_HASH = { 0 => 'zero',
                 1 => 'one',
                 2 => 'two',
                 3 => 'three',
                 4 => 'four',
                 5 => 'five',
                 6 => 'six' }.freeze

def alphabetic_numbers(numbers)
  english_array = []
  keys = []
  numbers.each { |num| english_array << NUMBERS_HASH[num] }
  english_array.sort.each do |word|
    keys << NUMBERS_HASH.key(word)
  end
  keys
end

p alphabetic_numbers((0..6).to_a)
