require 'id_generator'

class Location
  attr_reader :id
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
  end
end
