# write a random sentence with a sentence method

def sentence(name, activity)
  puts "#{name} went #{activity} today."
end

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

names = ["Nate", "Dave", "Dustin", "Ashley", "Nancy"]
activities = ["swimming", "running", "driving"]

sentence(name(names),activity(activities))