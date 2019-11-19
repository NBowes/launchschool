module Mailable
  def print_address
    puts name
    puts address
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Person
  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end
end

class Customer < Person
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee < Person
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new('Betty', '123 test street', 'testington', 'AL', 92034)
bob = Employee.new('Bob', '123 employee street', 'testville', 'CA', 90215)
betty.print_address
bob.print_address
