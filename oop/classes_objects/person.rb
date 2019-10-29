class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    name_parts = full_name.split
    @first_name = name_parts.first
    @last_name = name_parts.size > 1 ? name_parts[-1] : ' '
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    name_parts = full_name.split
    self.first_name = name_parts.first
    self.last_name = name_parts.size > 1 ? name_parts.last : ' '
  end

  def to_s
    name
  end
end

bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
bob.last_name = 'Smith'
p bob.name

p bob.name = 'John Adams'
p bob.first_name
p bob.last_name

rob = Person.new('Robert Smith')
bobby = Person.new('Robert Smith')
p rob.name == bobby.name
puts "The persons name is: #{rob}"
