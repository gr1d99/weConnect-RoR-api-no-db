require 'rails_helper'

RSpec.describe CategoryController, type: :controller do
  let(:json) { JSON.parse(response.body) }
  let!(:category_attributes) { attributes_for(:category) }
  let(:categories) { Categories.new }

  context 'when all attributes are provided' do
    before do
      post :create, params: category_attributes
    end

    it { is_expected.to respond_with(201) }

    it 'returns json with name of created object' do
      expect(json['name']).to eq(category_attributes[:name])
    end
  end

  context 'when name is blank' do
    before do
      post :create, params: {}
    end

    it { is_expected.to respond_with(422) }
  end
end