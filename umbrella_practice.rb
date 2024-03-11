pp "howdy"

pp "Where are you located?"

user_location=gets.chomp
#user_location=gets.chomp.gsub(" ","%20")
#user_location="Chicago"

pp user_location

maps_url="https://maps.googleapis.com/maps/api/geocode/json?address="+ user_location + "&key=" + ENV.fetch("GMAPS_KEY")

require "http"

resp=HTTP.get(maps_url)

raw_response=resp.to_s

require "json"

parsed_response= JSON.parse(raw_response)

results= parsed_response.fetch("results")

first_result=results.at(0)

geo=first_result.fetch("geometry")

loc= geo.fetch("location")

p latitude=loc.fetch("lat")
p longitude=loc.fetch("lng")

pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_KEY")

# Assemble the full URL string by adding the first part, the API token, and the last part together
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"

raw_pirate_weather_data = HTTP.get(pirate_weather_url)

parsed_pirate_weather_data = JSON.parse(raw_pirate_weather_data)

currently_hash = parsed_pirate_weather_data.fetch("currently")

current_temp = currently_hash.fetch("temperature")

puts "It is currently #{current_temp}°F."
