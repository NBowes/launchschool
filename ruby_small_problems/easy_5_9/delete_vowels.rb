# return the original input string without the vowels

def delete_vowels(array)
  new_array = []
  array.map do |word|
    new_array << word.gsub(/[aeiouAEIOU]/, '')
  end
  new_array
end

p delete_vowels(%w[abcdefghijklmnopqrstuvwxyz])
