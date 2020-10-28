require 'rails_helper'

RSpec.describe "Api::Regions", type: :request do
  # namespace :api, resources :regions, only: [:index], end
  
  # initialize test data
  let!(:regions) { create_list(:region, 4) }
  # let(:region_id) { regions.first.id }

  # Test suite for GET /regions
  describe 'GET /api/regions when sent as application/json' do
    before(:each) do 
      headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      get "/api/regions", :headers => headers
    end
    it 'returns the response as json' do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
    it 'returns the same number regions as created' do
      expect(JSON.parse(response.body).size).to eq(4)
    end
    it 'returns a status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  # TODO: Test to ensure all other routes non-existent?

end
