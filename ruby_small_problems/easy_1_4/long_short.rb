# method takes 2 strings
# put short string first
# concatenate strings so it prints short, long, short

def short_long(str1,str2)
  if str1.length < str2.length
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

puts short_long("stuff", "things")