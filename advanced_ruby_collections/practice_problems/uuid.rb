# Each UUID consists of 32 hexadecimal characters,
# and is typically broken into 5 sections like this 8-4-4-4-12
# and represented as a string.

def uuid_generate
  characters = []
  (0..9).each { |num| characters << num.to_s }
  ('a'..'f').each { |char| characters << char }
  
  uuid = ''
  sections = [8,4,4,4,12]
  sections.each_with_index do |num, index|
    num.times { uuid << characters.sample }
    uuid += '-' unless index == sections.size - 1
  end
  uuid
end

p uuid_generate
