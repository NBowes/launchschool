class Person
  # replace both with attr_accessor :name
  attr_reader :name
  attr_writer :name
end

person1 = Person.new
person1.name = 'Nathen'
p person1.name
