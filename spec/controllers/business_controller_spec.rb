require 'rails_helper'

RSpec.describe BusinessController, type: :controller do
  let!(:category_attributes) { attributes_for(:category) }
  let!(:location_attributes) { attributes_for(:locations) }
  let!(:business_attributes) { attributes_for(:business) }
end
