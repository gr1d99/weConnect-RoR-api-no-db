require 'rails_helper'
require 'spec_helper'

RSpec.describe Location do
  let!(:details) do
    {
      city: 'Nairobi',
      email: 'business@gmail.com',
      country: 'Kenya',
      street: 'Tom Mboya 118',
      state: 'Nairobi',
      zip_code: '1202',
      phone_number: '07**********'
    }
  end

  context 'instance methods' do
    let!(:actual_methods) do
      %i[id state email country street city zip_code phone_number]
    end

    let!(:expected_methods) do
      Location.public_instance_methods(false)
              .select! { |method| method unless method.to_s.end_with? '=' }
    end

    it 'has all expected methods' do
      expect(expected_methods.empty?).not_to be_truthy
      expect(expected_methods.length).to eq(actual_methods.length)
      actual_methods.each do |method|
        expect(expected_methods.include?(method)).to be_truthy
      end
    end
  end

  context 'when all attributes are provided' do
    let!(:valid_location) do
      Location.new(details)
    end

    it 'has an ID' do
      expect(valid_location.id).not_to be_nil
    end
  end

  context 'when any of the attributes is missing' do
    before do
      details.delete(:city)
    end

    it 'raises an error' do
      expect { Location.new(details) }.to raise_error(ArgumentError)
    end

    it 'is invalid' do
      expect { Location.new(details) }
    end
  end
end
