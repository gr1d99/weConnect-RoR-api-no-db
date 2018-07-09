require 'id_generator'

class Business
  include Validator

  attr_reader :created_at, :updated_at, :id, :has_errors, :errors
  attr_accessor :name, :category_id, :location_id
  def initialize(
    name:, category_id:, location_id:
  )
    @name = name
    @category_id = category_id
    @location_id = location_id
    @created_at = Time.now.strftime('%Y-%m-%d %H:%M')
    @updated_at = Time.now.strftime('%Y-%m-%d %H:%M')
    @id = generate_id
    @has_errors = false
    @errors = {}

    method(__method__).parameters.map do |_, param_name|
      value = binding.local_variable_get(param_name)
      validate(param_name, value)
    end
  end

  def self.create(params)
    new(
      name: params[:name],
      category_id: params[:category_id],
      location_id: params[:location_id]
    )
  end
end
