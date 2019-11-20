module Walkable
  def walk
    puts "#{self} #{gait} forward."
  end
end

class Mammal
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Person < Mammal
  private

  def gait
    'strolls'
  end
end

class Noble < Mammal
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    'struts'
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

byron = Noble.new('Byron', 'Lord')
byron.walk
