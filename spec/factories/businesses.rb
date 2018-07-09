FactoryBot.define do
  factory :business do
    name Faker::Name.unique.name
    category_id Faker::Number.unique.number
    location_id Faker::Number.unique.number
  end
end