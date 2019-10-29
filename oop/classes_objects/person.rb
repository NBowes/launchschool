class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    name_parts = full_name.split
    @first_name = name_parts.first
    @last_name = name_parts.size > 1 ? name_parts[-1] : ' '
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end
end

bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
bob.last_name = 'Smith'
p bob.name
