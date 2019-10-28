module Speak
    def speak(sound)
        puts "#{sound}"
    end
end

class MyClass
    include Speak
end

variable = MyClass.new