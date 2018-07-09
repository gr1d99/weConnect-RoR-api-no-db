require 'rails_helper'
require 'spec_helper'

RSpec.describe Business do
  let!(:category) { Category.new(name: 'Business') }
  let!(:location) do
    Location.new(
      city: 'Nairobi',
      email: 'business@gmail.com',
      country: 'Kenya',
      street: 'Tom Mboya 118',
      state: 'Nairobi',
      zip_code: '1202',
      phone_number: '07**********'
    )
  end

  context 'arguments' do
    let!(:arguments) do
      {
        name: 'Some Name',
        category_id: category.id,
        location_id: location.id
      }
    end

    let!(:business) { Business.new(arguments) }

    context 'when all arguments are provided' do
      it 'creates an object' do
        expect(business).to be_an_instance_of(Business)
      end

      it 'has exact values' do
        expect(business.name).to eq(arguments[:name])
        expect(business.category_id).to eq(arguments[:category_id])
        expect(business.location_id).to eq(arguments[:location_id])
      end
    end

    context 'read only methods' do
      it 'generates created_at date on creation' do
        expect(business.created_at).not_to be_nil
      end

      it 'generates updated_at date on creation' do
        expect(business.updated_at).not_to be_nil
      end
    end
  end
end
