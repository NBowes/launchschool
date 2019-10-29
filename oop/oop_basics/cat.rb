module Walkable
  def walk
    puts "Let's go for a walk."
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, I'm #{name}."
  end
end

kitty = Cat.new('liam')
kitty.greet
kitty.name = 'Liam'
kitty.greet
kitty.walk
