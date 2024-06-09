class HomeController < ApplicationController
  def index
    @services = Service.filtered params[:filters]
    @locations = @services.map {|s| { latitude: s.member.latitude, longitude: s.member.longitude, tooltip: s.member.display_name, label: "$#{s.price["small_dog"]}" } } 
    @locations = [{latitude: 37.765, longitude: -122.424}] if @locations.empty?
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
end
