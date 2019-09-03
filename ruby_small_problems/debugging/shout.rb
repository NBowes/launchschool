def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

## fixed

def shout_out_to(name)
  name = name.chars.each(&:upcase!).join

  puts 'HEY ' + name
end

shout_out_to('you')
