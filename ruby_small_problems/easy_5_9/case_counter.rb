def case_counter(string)
  cases = { lowercase: nil, uppercase: nil, neither: nil }
  neither = string.gsub(/[a-zA-Z]/, '')
  cases[:neither] = neither.length
  string.delete!(neither)
  uppercase = string.gsub(/[a-z0-9\s]/, '')
  lowercase = string.gsub(/[A-Z0-9\s]/, '')
  cases[:uppercase] = uppercase.length
  cases[:lowercase] = lowercase.length
  cases
end

p case_counter('AbCd +Ef')

## alternate

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
