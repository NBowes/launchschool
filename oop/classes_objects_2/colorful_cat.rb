class Cat
  COLOR = 'orange'
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello, my name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Liam')
p kitty.greet