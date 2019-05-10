# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.
# Three grades

def grades(grade1, grade2, grade3)
  avg = (grade1 + grade2 + grade3) / 3
  
  case avg
  when 90..100 then "A"
  when 80..90 then "B"
  when 70..80 then "C"
  when 60 .. 70 then "D"
  else
    "F"
  end
end

p grades(50, 50, 95)
