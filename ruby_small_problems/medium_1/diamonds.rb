# Write a method that displays a 4-pointed diamond in an n x n grid
# Assume that 'n' is an odd integer

def diamond(num)
  stars = []
  1.upto(num) do |index|
    star_row = "*" * index
    stars << star_row.center(num)
  end
  num.downto(1) do |index|
    star_row = "*" * (index)
    stars << star_row.center(num)
  end
  stars.each {|star| puts star}
end

diamond(5)

# solution is a little bit wonky, but it's the right idea