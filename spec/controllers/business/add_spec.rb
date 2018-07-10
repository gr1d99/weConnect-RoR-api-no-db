require 'rails_helper'
require 'spec_helper'

RSpec.describe BusinessController do
  let(:json) { JSON.parse(response.body) }
  let!(:business_params) { attributes_for(:business) }

  context 'when all attributes are provided' do
    before do
      post :create, params: business_params
    end

    it { is_expected.to respond_with(201) }
    it 'returns json with 6 keys only' do
      expect(json.keys.length).to eq(5)
    end

    it 'returns business object attributes' do
      expect(json['name']).not_to be_nil
      expect(json['category']).not_to be_nil
      expect(json['location']).not_to be_nil
      expect(json['id']).not_to be_nil
      expect(json['created_at']).not_to be_nil
    end
  end

  context 'when some of the attributes are blank' do
    before do
      business_params[:name] = nil
      post :create, params: business_params
    end

    it { is_expected.to respond_with(422) }
    it 'returns correct error message for blank field' do
      expect(json['errors']['name']).not_to be_nil
      expect(json['errors']['name']).to include('name can\'t be blank')
    end
  end
end