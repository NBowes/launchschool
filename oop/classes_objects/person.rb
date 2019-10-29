class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end


bob = Person.new('bob')
bob.name
bob.name = 'Robert'
bob.name
