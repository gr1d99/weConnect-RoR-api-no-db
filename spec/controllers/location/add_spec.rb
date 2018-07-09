require 'rails_helper'
require 'spec_helper'

RSpec.describe LocationController do
  let(:json) { JSON.parse(response.body) }
  let!(:location_attributes) { attributes_for(:location) }

  context '#create' do
    context 'when given all attributes' do
      before do
        post :create, params: location_attributes
      end

      it { is_expected.to respond_with(201) }
    end

    context 'when' do
      let!(:location_params) { location_attributes }
      context 'street value is missing' do
        before do
          location_params['street'] = nil
          post :create, params: location_params
        end

        it { is_expected.to respond_with(422) }

        it 'returns street can\'t be blank' do
          expect(json['errors']['street']).to include('street can\'t be blank')
        end
      end

      context 'street and city values are missing' do
        before do
          location_params['street'] = nil
          location_params['city'] = nil
          post :create, params: location_params
        end

        it { is_expected.to respond_with(422) }

        it 'returns street can\'t be blank' do
          puts json.inspect
          expect(json['errors']['street']).to include('street can\'t be blank')
        end

        it 'returns city can\'t be blank' do
          expect(json['errors']['city']).to include('city can\'t be blank')
        end
      end
    end
  end
end