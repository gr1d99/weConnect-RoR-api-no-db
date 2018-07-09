require 'categories'

CATEGORIES ||= Categories.new

class CategoryController < ApplicationController
  def create
    category = Category.create(category_params[:name])
    if category.has_errors
      errors = { errors: { name: category.errors } }
      render json: errors, status: :unprocessable_entity
    else
      CATEGORIES.add(category)
      payload = { id: category.id, name: category.name }
      render json: payload, status: :created
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
