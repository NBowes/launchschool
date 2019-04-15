MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(minutes)
  day_minutes = minutes % MINUTES_PER_DAY
  hour, minute = day_minutes.divmod(MINUTES_PER_HOUR)
  format('%02u:%02u', hour, minute)
end

p time_of_day(140)
