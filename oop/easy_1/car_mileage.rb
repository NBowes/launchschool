class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    @mileage += miles
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 50000
car.increment_mileage(555)
car.print_mileage
