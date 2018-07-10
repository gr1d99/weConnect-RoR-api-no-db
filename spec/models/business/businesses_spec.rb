require 'spec_helper'
require 'rails_helper'

RSpec.describe Businesses do
  let(:category) do
    Category.new(attributes_for(:category))
  end

  let(:location) do
    Location.new(attributes_for(:location))
  end

  let(:business_attributes) do
    name = Faker::Name.unique.name
    {
      name: name,
      category_id: category.id,
      location_id: location.id
    }
  end

  let(:business) do
    Business.new(business_attributes)
  end

  let(:businesses) { Businesses.new }

  it 'saves business object in an array' do
    expect(businesses.count).to eq(0)
    businesses.add(business)
    expect(businesses.count).to eq(1)
  end
end