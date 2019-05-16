def select_fruit(produce)
  fruit_hash = {}
  produce.select { |k, v| fruit_hash[k] = v if v == 'Fruit' }
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
p select_fruit(produce) == { 'apple' => 'Fruit', 'pear' => 'Fruit' }

## make a solution that uses loop do vs. select

def selected_fruits(produce_list)
  produce_keys = produce_list.keys
  fruits = {}
  count = 0

  loop do
    current_item = produce_keys[count]
    if produce_list[current_item] == 'Fruit'
      fruits[current_item] = produce_list[current_item]
    end
    count += 1

    break if count == produce_keys.size - 1
  end
  fruits
end

p selected_fruits(produce) == { 'apple' => 'Fruit', 'pear' => 'Fruit' }

## make a solution that uses loop and counts down

def just_fruits(produce_list)
  produce_keys = produce_list.keys
  count = produce_keys.size
  fruit = {}

  loop do
    current_product = produce_keys[count]
    if produce_list[current_product] == 'Fruit'
      fruit[current_product] = produce_list[current_product]
    end
    count -= 1
    break if count < 0
  end
  fruit.keys.sort!
  fruit
end

p just_fruits(produce) == { 'apple' => 'Fruit', 'pear' => 'Fruit' }

## transform

def double_numbers(numbers)
  count = 0
  doubled = []

  loop do
    break if count == numbers.size

    doubled << numbers[count] * 2
    count += 1
  end
  doubled
end

numbers = [1, 2, 3, 4, 6]
p double_numbers(numbers)

## transform based on multiple

def doubled(numbers, multiplier)
  count = 0
  doubled = []

  loop do
    break if count == numbers.size

    doubled << numbers[count] * multiplier
    count += 1
  end
  doubled
end

numbers = [1, 2, 3, 4, 6]
p doubled(numbers, 3)
