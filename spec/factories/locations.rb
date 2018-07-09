FactoryBot.define do
  factory :location do
    street Faker::Address.street_name
    city Faker::Address.city
    state Faker::Address.state
    zip_code Faker::Address.zip_code
    country Faker::Address.country
    phone_number Faker::PhoneNumber.phone_number
    email Faker::Internet.email
  end
end