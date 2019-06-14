# read a text file
# sentence can end in '.', '!', or '?'

f = File.read('longest_sentence.txt')
sentences = f.split(/\.|!|\?/)
longest_sentence = sentences.max_by { |sentence| sentence.split.size}
longest_sentence = longest_sentence.strip
number_of_words = longest_sentence.split.size

puts "The longest sentence has #{number_of_words} words in it"

## alternate
def longest(sentences)
  longest = 0
  sentences.each do |sentence|
    if sentence.strip.split.size > longest
      longest = sentence.strip.split.size
    end
  end
  longest
end

p longest(sentences)