# config/initializers/geocoder.rb

# Set timeout because Geocoding API may not respond fast enough 
Geocoder.configure(:timeout => 5)