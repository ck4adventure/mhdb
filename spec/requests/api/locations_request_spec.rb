require 'rails_helper'

RSpec.describe "Api::Locations", type: :request do
  # namespace :api, resources :locations, except: [:destroy], end
  
  # Initialize test data
  Location.destroy_all
  let!(:locations) { create_list(:location, 2) }
  let!(:location_id) { locations.first.id }

  # Index: Test suite for GET /api/locations
  describe 'GET /api/locations when sent as application/json' do
    before(:each) do 
      headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      get "/api/locations", :headers => headers
    end
    it 'returns the response as json' do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
    it 'returns an array of location objects' do
      expect(JSON.parse(response.body).is_a?(Array)).to be true
    end
    it 'returns the same number locations as created' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
    it 'returns a status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  # Show: Test suite for GET /api/locations/:id
  describe 'GET /api/locations/:id' do
    before(:each) do 
      headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      get "/api/locations/#{location_id}", :headers => headers
    end
    it 'returns the response as json' do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
    it 'returns a single location object and not an array' do
      expect(JSON.parse(response.body).is_a?(Object)).to be true
      expect(JSON.parse(response.body).is_a?(Array)).to be false
      
    end
    it 'returns a status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  # Test suite for POST /api/locations
  describe 'POST /api/locations' do
    context 'when the request is valid' do
      # valid payload
      let(:valid_attributes) { build_stubbed(:location) }
      before(:each) do 
        headers = {
          "ACCEPT" => "application/json",     # This is what Rails 4 accepts
          "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
        }
        post "/api/locations", :params => { location: { name: "testthree", rank_id: Rank.first.id, region_id: Region.first.id } }, :headers => headers
      end

      it 'creates a location' do
        expect(JSON.parse(response.body)['name']).to eq("testthree")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/locations', params: { location: { title: 'Foobar' }} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Unable to save location/)
      end
    end
  end

  # Test suite for PUT /api/locations/:id
  describe 'PUT /api/locations/:id' do
    context 'when the request is valid' do
      # valid payload
      let(:location) { locations.first }
      before(:each) do 
        headers = {
          "ACCEPT" => "application/json",     # This is what Rails 4 accepts
          "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
        }
        put "/api/locations/#{location.id}", :params => { id: "#{location.id}", location: { name: "newname", },}, :headers => headers
      end

      it 'updates a location' do
        expect(JSON.parse(response.body)['name']).to eq("newname")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      let(:location) { locations.first }
      before(:each) do
        headers = {
          "ACCEPT" => "application/json",     # This is what Rails 4 accepts
          "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
        }
         put "/api/locations/#{location.id}", :params => { id: "#{location.id}", location: { title: 'Foobar', rank_id: 99 } }, :headers => headers
      end

      it 'returns status code 400/ bad request' do
        expect(response).to have_http_status(400)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Unable to update location/)
      end
    end
  end



# #Todo: add tests for dormancy of non-existent routes?

end
