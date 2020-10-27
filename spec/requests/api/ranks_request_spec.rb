require 'rails_helper'

RSpec.describe "Api::Ranks", type: :request do
  # Initialize test data
  let!(:ranks) { create_list(:rank, 4) }
  let(:rank_id) { Rank.first.id }

  # Test suite for GET /api/ranks
  describe 'GET /api/ranks when sent as application/json' do
    before(:each) do 
      headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      get "/api/ranks", :headers => headers
    end
    it 'returns all the ranks as json' do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
    it 'returns the same number ranks as created' do
      expect(JSON.parse(response.body).size).to eq(4)
    end
    it 'returns a status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  # TODO: Test to ensure all other routes non-existent?
end
