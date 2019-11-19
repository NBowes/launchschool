class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

house1 = House.new(100_000)
house2 = House.new(150_000)
puts 'House 1 is cheaper' if house1 < house2
puts 'House 2 is more expensive' if house2 > house1
