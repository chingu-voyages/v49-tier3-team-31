class HomeController < ApplicationController
  def index
    current_params = filters_params unless params[:filters].nil?
    lat, long = coordinates current_params
    @services = Service.filtered current_params, lat, long
    @locations = @services.map {|s| { latitude: s.member.latitude, longitude: s.member.longitude, tooltip: s.member.display_name, label: "$#{s.price["small_dog"]}" } } 
    @locations = [{latitude: lat, longitude: long}] if @locations.empty?
    @zip = current_user&.zip || "94041"
  end

  private

  def filters_params
    params.require(:filters).permit(:service_type, :location, :pet_number, dates: [:start, :end], pet_types: [:dog, :cat],
      dog_size: [:s, :m, :l, :xl], price: [:min, :max], filters: [
        housing_conditions: [:has_house, :has_fence, :furniture_allowed, :bed_allowed, :no_smoking],
        pets_in_home: [:no_dog, :no_cat, :one_at_a_time, :no_caged_pets],
        children_in_home: [:none, :none_0_to_5, :none_6_to_12],
        additional_services: [:puppy_care, :cat_care, :accepts_unspayed_females, :accepts_non_neutered_male, :bathing_grooming, :first_aid]
      ])
  end

  def coordinates(current_params)
    if current_params && current_params[:location] && current_params[:location] != (current_user&.zip || "94041")
      location_to_lat_long(current_params[:location])
    else
      [current_user&.latitude || 37.3897, current_user&.longitude || -122.0832] 
    end
  end

  def location_to_lat_long(zip)
    puts "Calling GeoCode API..."
    location = Net::HTTP.get(URI("https://api.mapbox.com/search/geocode/v6/forward?q=#{zip}&access_token=#{ENV["MAPBOX_ACCESS_TOKEN"]}"))
    res = JSON.parse(location)
    lat_long = res["features"].first["properties"]["coordinates"]
    [lat_long["latitude"], lat_long["longitude"]]
  end
end
