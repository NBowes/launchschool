class Flight
  # remove attr_accessor here - we don't want to give easy access to DB handle
  # attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end