require 'spec_helper'
require 'rails_helper'

RSpec.describe Category do
  let!(:detail) { { name: 'Business' } }
  let!(:category) { Category.new(detail) }

  context 'when name is provided' do
    it 'creates a new category' do
      expect(Category.create(detail)).to be_an_instance_of(Category)
    end

    it 'has id' do
      expect(category.id).not_to be_nil
    end

    it 'has given name' do
      expect(category.name).to eq(detail[:name])
    end
  end

  context 'when name is not provided' do
    it 'raises an exception' do
      expect { Category.new }.to raise_exception(ArgumentError)
    end
  end

  context 'when name is blank' do
    let!(:category) { Category.new(name: nil) }
    let!(:error_message) { "Name can't be blank" }

    it 'adds errors to errors list' do
      expect(category.errors.length).to eq(1)
    end

    it 'returns correct error message' do
      expect(category.errors).to include(error_message)
    end
  end
end
