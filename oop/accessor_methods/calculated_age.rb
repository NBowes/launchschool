class Person
  def age
    double(@age)
  end

  def age=(age)
    @age = double(age)
  end

  private

  def double(value)
    value * 2
  end
end

person = Person.new
person.age = 20
puts person.age
