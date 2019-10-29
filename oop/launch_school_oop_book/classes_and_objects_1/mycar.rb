require 'Time'
module Carryable
    def can_carry?(pounds)
        pounds < 2000 ? true : false
    end
end

class Vehicle
    @@number_of_vehicles = 0
    attr_accessor :color
    attr_reader :year, :model

    def initialize(year, color, model)
        @@number_of_vehicles += 1
        @year = year
        @color = color
        @model = model
        @current_speed = 0
    end

    def age
        puts "The #{self.model} is #{years_old} years old."
    end

    def speed_up(speed)
        @current_speed += speed
        puts "The car speeds up to #{@current_speed}"
    end

    def brake(speed)
        @current_speed -= speed
        puts "The car is slowing down to #{@current_speed}"
    end

    def current_speed
        puts "The car is now going #{@current_speed}"
    end

    def shut_off_car
        @current_speed = 0
        puts "Let's park this car"
    end

    def spray_paint(color)
        self.color = color
        puts "The car got painted the color #{color}"
    end

    def self.gas_mileage(litres, kilometers)
        puts "Gas Mileage: #{litres}L per #{kilometers} kilometers"
    end

    def self.number_of_vehicles
        puts "This program created #{@@number_of_vehicles} vehicles"
    end

    private

    def years_old
        Time.now.year - self.year
    end
end

class MyCar < Vehicle
   DOORS = 4
end

class MyTruck < Vehicle
    include Carryable
    DOORS = 2
end

westy = MyCar.new(1991, 'White','Volkswagen')
puts westy.color
puts westy.year
westy.age
westy.speed_up(10)
westy.current_speed
westy.speed_up(10)
westy.current_speed
westy.brake(20)
westy.current_speed
westy.shut_off_car
westy.spray_paint('Sand')

MyCar.gas_mileage(10,100)

ram = MyTruck.new(2017, 'Black', 'Dodge')
puts ram.color
ram.age
puts ram.can_carry?(1950)

Vehicle.number_of_vehicles
puts Vehicle.ancestors
puts MyTruck.ancestors
puts MyCar.ancestors
