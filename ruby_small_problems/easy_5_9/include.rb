def include?(array, element)
  array.each { |obj| return true if obj == element }
  false
end
