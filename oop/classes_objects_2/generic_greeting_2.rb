class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello, I'm a cat."
  end

  def personal_greeting
    puts "Hello, my name is #{name}."
  end
end

kitten = Cat.new('Liam')
Cat.generic_greeting
kitten.personal_greeting

cat2 = Cat.new('Noel')
cat2.personal_greeting
