class Expander
  def initialize(string)
    @string = string
  end
  
  def to_s
    expand(3)
  end

  private

  def expand(num)
    @string * num
  end
end

expander = Expander.new('xyz')
puts expander
