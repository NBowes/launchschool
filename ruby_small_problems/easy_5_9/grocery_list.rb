def grocery_list(fruit_array)
  fruit_array.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p grocery_list([['bananas',2],['orange',1],['mangos',3]])
