class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

truck = Truck.new('GMC', 'Sierra Elevation', 2100)
car = Car.new('Jeep', 'Sahara')
bike = Motorcycle.new('Piagio', 'Fly 150')
puts truck
puts car
puts bike
