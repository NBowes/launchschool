module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Mammal
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Person < Mammal
  private

  def gait
    'strolls'
  end
end

class Cat < Mammal
  private 

  def gait
    'saunters'
  end
end

class Cheetah < Mammal
  private

  def gait
    'runs'
  end
end

mike = Person.new('Mike')
mike.walk

kitty = Cat.new('Kitty')
kitty.walk

flash = Cheetah.new('Flash')
flash.walk
