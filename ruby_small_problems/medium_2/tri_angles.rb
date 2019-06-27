# angles sum must be above 180
# all angles must be greater than 0

def triangle(a, b, c)
  angles = [a, b, c]
  if sum_180?(angles) && above_zero?(angles)
    if angles.all? { |tri| tri < 90 }
      :acute
    elsif angles.any? { |tri| tri == 90 }
      :right
    else
      :obtuse
    end
  else
    :invalid
  end
end

def sum_180?(angles)
  angles.inject(&:+) == 180
end

def above_zero?(angles)
  angles.all? { |tri| tri > 0 }
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
