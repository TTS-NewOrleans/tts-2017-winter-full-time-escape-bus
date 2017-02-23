module LocationsHelper
  # Get all the buses and store them as a Ruby array of hashes
  def fetch_buses_from_api(source_url)
    http_response = Net::HTTP.get_response(URI.parse(source_url))
    data = http_response.body
    JSON.parse(data)
  end

  # Return true if a bus is "near" a user
  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    # Define "nearby" as a max distance in degrees
    max_distance = 0.01

    # Compare user location and bus location
    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f
    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
    # if it's "nearby" return true
    distance <= max_distance
  end
end
