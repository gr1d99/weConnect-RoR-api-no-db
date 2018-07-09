require 'spec_helper'
require 'rails_helper'

RSpec.describe Categories do
  let(:category) do
    Category.create(attributes_for(:category))
  end

  let(:categories) { Categories.new }

  it 'add category object to categories array' do
    expect(categories.count).to eq(0)
    categories.add(category)
    expect(categories.count).to eq(1)
  end
end
