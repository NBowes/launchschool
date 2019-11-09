class Person
  attr_writer :phone_number
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Nathen'
person1.phone_number = '6135551234'
p person1.name