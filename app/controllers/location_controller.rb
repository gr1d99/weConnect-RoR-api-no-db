@locations ||= Locations.new

class LocationController < ApplicationController
  def create
    location = Location.create(location_params)
    if location.has_errors
      render json: { errors: location.errors }, status: :unprocessable_entity
    else
      render json: location_info(location), status: :created
    end
  end

  private

  def location_params
    params.permit(
      :city,
      :country,
      :email,
      :phone_number,
      :state,
      :street,
      :zip_code
    )
  end

  def location_info(location)
    {
      id: location.id,
      city: location.city,
      country: location.country,
      email: location.email,
      phone_number: location.phone_number,
      state: location.state,
      street: location.street,
      zip_code: location.zip_code
    }
  end
end
