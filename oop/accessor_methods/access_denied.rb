class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(6135551234)
p person1.phone_number

person1.phone_number = 6138189293 # => Expecting NoMethodError
p person1.phone_number
