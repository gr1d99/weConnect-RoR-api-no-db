require 'spec_helper'
require 'rails_helper'

RSpec.describe Category do
  let!(:category) { Category.new }

  context 'when name is provided' do
    let!(:valid_category) do
      category.name = 'Business'
      category
    end

    it 'is valid' do
      expect(valid_category.valid?).to be_truthy
    end

    it 'has id' do
      expect(valid_category.id).not_to be_nil
    end
  end

  context 'when name is not provided' do
    let!(:invalid_category) do
      category.name = nil
      category
    end

    it 'is invalid' do
      expect(category.valid?).to be_falsey
    end
  end
end
