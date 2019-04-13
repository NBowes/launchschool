# return minutes before/after midnight - 24 hour clock
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def before_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def after_midnight(time)
  MINUTES_PER_DAY - before_midnight(time)
end

p before_midnight('12:34')
p after_midnight('12:34')
