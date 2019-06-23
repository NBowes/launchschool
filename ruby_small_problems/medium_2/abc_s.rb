# determine if the blocks can spell the string
# blocks can only be used once

def block_word?(string)
  blocks = %w[B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M]
  blocks.map! do |block|
    block.split(':').join
  end
  chars = string.upcase
  blocks.none? { |block| chars.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

def block_word_hash?(string)
  blocks = { B: 'O', X: 'K', D: 'Q', C: 'P', N: 'A',
             G: 'T', R: 'E', F: 'S', J: 'W', H: 'U',
             V: 'I', L: 'Y', Z: 'M' }
  string.upcase.chars.each do |char|
    if blocks.value?(char) || blocks.key?(char.to_sym)
      blocks.delete_if { |key, value| key == char || value == char }
    else
      return false
    end
  end
  true
end

p block_word_hash?('BATCH') == true
p block_word_hash?('BUTCH') == false
p block_word_hash?('jest') == true
