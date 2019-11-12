class Person
  attr_reader :name

  def name=(name)
    @name = name.capitalize
  end
end

person = Person.new
person.name = 'nAtHeN'
puts person.name
