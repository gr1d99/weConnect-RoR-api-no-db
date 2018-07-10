require 'rails_helper'
require 'spec_helper'

RSpec.describe Locations do
  let!(:location_1) { Location.create(attributes_for(:location)) }
  let!(:location_2) { Location.create(attributes_for(:location)) }
  let!(:locations) { Locations.new }

  context '.add' do
    it 'adds location to an Array' do
      locations.add(location_1)
      expect(locations.locations.length).to be(1)
    end
  end

  context '.get_location' do
    before do
      locations.add(location_1)
      locations.add(location_2)
    end

    context 'when location_id id given' do
      context 'and it exists' do
        it 'retrieves location' do
          expect(locations.find(location_1.id)).to eq(location_1)
          expect(locations.find(location_2.id)).to eq(location_2)
        end
      end

      context 'and it does not exist' do
        it 'returns an empty array' do
          expect(locations.find('invalid_id')).to eq([])
        end
      end
    end
  end
end
