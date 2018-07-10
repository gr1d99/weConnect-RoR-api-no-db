class BusinessController < ApplicationController
  def create
    business = Business.create(business_params)

    if business.has_errors
      render json: { errors: business.errors }, status: :unprocessable_entity
    else
      render json: business_info(business), status: :created
    end
  end

  private

  def business_params
    params.permit(:name, :location_id, :category_id)
  end

  def business_info(business)
    {
      id: business.id,
      name: business.name,
      location_id: business.location_id,
      category_id: business.category_id,
      created_at: business.created_at,
    }
  end
end
