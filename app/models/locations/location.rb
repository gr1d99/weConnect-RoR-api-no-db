require 'id_generator'

class Location
  attr_reader :id, :errors, :has_errors
  attr_accessor(
    :street,
    :city,
    :state,
    :zip_code,
    :country,
    :phone_number,
    :email
  )

  def initialize(
    street:,
    city:,
    state:,
    zip_code:,
    country:,
    phone_number:,
    email:
  )
    @id = generate_id
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @country = country
    @phone_number = phone_number
    @email = email
    @has_errors = false
    @errors = {}

    method(__method__).parameters.map do |_, name|
      value = binding.local_variable_get(name)
      validate(name, value)
    end
  end

  def self.create(params)
    new(
      street: params[:street],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      country: params[:country],
      phone_number: params[:phone_number],
      email: params[:email]
    )
  end

  private

  def add_error(attribute, error)
    key = attribute.to_sym

    if @errors[key]
      @errors[key].push(error)
    else
      @errors[key] = [].push(error)
    end

    @has_errors = true
  end

  def validate(name, value)
    validate_blank(name, value)
  end

  def validate_blank(name, value)
    return unless value.blank?
    error = "#{name} can't be blank"
    add_error(name, error)
  end
end
