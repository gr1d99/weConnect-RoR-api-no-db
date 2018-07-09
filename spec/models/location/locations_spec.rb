require 'rails_helper'
require 'spec_helper'

RSpec.describe Locations do
  let!(:location) { Location.create(attributes_for(:location)) }
  let!(:locations) { Locations.new }

  context '.add' do
    it 'adds location to an Array' do
      locations.add(location)
      expect(locations.locations.length).to be(1)
    end
  end
end
