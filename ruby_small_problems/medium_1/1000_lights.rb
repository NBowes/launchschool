# Write a method that takes one argument, the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.
# Each switch is connected to exactly one light that is initially off
# Second pass (2, 4, 6) third pass (3, 6, 9) fourth pass (4, 8, 12)

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

def initalize(num_lights)
  lights = {}
  1.upto(num_lights) do |num|
    lights[num] = 'off'
  end
  lights
end

def toggle_light(lights, nth)
  lights.each do |position, state|
    if (position % nth).zero?
      lights[position] = state == 'off' ? 'on' : 'off'
    end
  end
end

def lights_on(lights)
  lights.select { |_light_position, status| status == 'on' }.keys
end

def lightswitches(num_lights)
  lights = initalize(num_lights)
  1.upto(num_lights) do |round|
    toggle_light(lights, round)
  end
  lights_on(lights)
end

p lightswitches(100)

## simplified (not breaking it down into it's own methods)

def light_switches_on(num_switches)
  lights = {}
  round = 1

  # init lights hash with 'off' values for each light switch
  1.upto(num_switches) do |num|
    lights[num] = 'off'
  end

  while round <= num_switches
    lights.each do |light_position, status|
      if (light_position % round).zero?
        lights[light_position] = status == 'off' ? 'on' : 'off'
      end
    end
    round += 1
  end
  lights.select { |_, status| status == 'on' }.keys
end

p light_switches_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
