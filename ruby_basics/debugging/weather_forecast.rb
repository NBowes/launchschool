def predict_weather
  sunshine = ['true', 'false'].sample # a string object is always truthy except for nil and the false Boolean

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

