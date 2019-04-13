# validate numbers
# validate operator
# print result with 'adding..' message
# ask for user's name
# ask if you want to do another calculation
# goodbye message

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'sp'.freeze

def message(message, lang)
  MESSAGES[lang][message]
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def operator_message(operator)
  case operator
  when '1'
    puts message('add', LANGUAGE)
  when '2'
    puts message('subtract', LANGUAGE)
  when '3'
    puts message('multiply', LANGUAGE)
  when '4'
    puts message('divide', LANGUAGE)
  end
end

puts message('name', LANGUAGE)
name = nil

loop do
  name = gets.chomp

  puts message('invalid_name', LANGUAGE) if name.empty?
  break if name
end

puts message('hello', LANGUAGE) + name + '!'
loop do
  number1 = nil
  loop do
    puts message('first_number', LANGUAGE)
    number1 = gets.chomp

    break if number?(number1)

    puts message('invalid_number', LANGUAGE)
  end

  number2 = nil
  loop do
    puts message('second_number', LANGUAGE)
    number2 = gets.chomp

    break if number?(number2)

    puts message('invalid_number', LANGUAGE)
  end

  puts message('operator_choice_message', LANGUAGE)

  operator = nil
  loop do
    operator = gets.chomp

    break if %(1,2,3,4).include?(operator)

    puts message('invalid_operator', LANGUAGE)
  end

  operator_message(operator)

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  puts message('result', LANGUAGE) + result.round(2)
  puts message('another_calculation', LANGUAGE)
  answer = gets.chomp

  break if answer.casecmp('n').zero?
end

puts message('end_program', LANGUAGE)
