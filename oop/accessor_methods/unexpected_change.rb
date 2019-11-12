class Person
  def name=(name)
    @first_name, @last_name = name.split(' ')
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new
person.name = 'John Doe'
puts person.name