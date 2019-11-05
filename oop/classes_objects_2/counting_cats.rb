class Cat
  @@total_cats = 0
  
  def initialize
    @@total_cats += 1
  end

  def self.total
    @@total_cats 
  end
end

kitty = Cat.new
kitten = Cat.new

p Cat.total