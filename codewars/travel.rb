=begin
The function travel will take two parameters r (addresses' list of all clients' as a string) and zipcode and returns a string in the following format:

zipcode:street and town,street and town,.../house number,house number,...

The street numbers must be in the same order as the streets where they belong.

If a given zipcode doesn't exist in the list of clients' addresses return "zipcode:/"

examples:

r = "123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432"

travel(r, "OH 43071") --> "OH 43071:Main Street St. Louisville,Main Long Road St. Louisville/123,432"

travel(r, "NY 56432") --> "NY 56432:High Street Pollocksville/786"

travel(r, "NY 5643") --> "NY 5643:/"
=end

def travel(list, zip)
  houses = list.split(',')
  house_numbers = []
  street_addresses = []
  houses.select do |house|
    house[-8..-1] == zip
  end
        .map!(&:split)
        .each do |house|
          house_numbers << house[0]
          street_addresses << house[1..- 3].join(' ')
        end
  "#{zip}:#{street_addresses.join(',')}/#{house_numbers.join(',')}"
end

r = '123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432'

p travel(r, 'OH 43071') == 'OH 43071:Main Street St. Louisville,Main Long Road St. Louisville/123,432'

p travel(r, 'NY 56432') == 'NY 56432:High Street Pollocksville/786'

p travel(r, 'NY 5643') == 'NY 5643:/'
