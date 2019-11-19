module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bob_car = Car.new
bob_car.drive
