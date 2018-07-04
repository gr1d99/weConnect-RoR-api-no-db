require 'spec_helper'
require 'rails_helper'

RSpec.describe Category do
  let!(:detail) { { name: 'Business' }}
  let!(:category) { Category.new(detail) }

  context 'when name is provided' do
    it 'has id' do
      expect(category.id).not_to be_nil
    end

    it 'has given name' do
      expect(category.name).to eq(detail[:name])
    end
  end

  context 'when name is not provided' do
    it 'raises an exception' do
      expect{ Category.new }.to raise_exception(ArgumentError)
    end
  end
end
