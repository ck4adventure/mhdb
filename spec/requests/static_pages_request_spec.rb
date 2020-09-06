require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe '#main' do
    it 'returns the main page' do
      get "/"
      expect(response).to render_template(:main)
      expect(response).to have_http_status(:ok)
    end
  end
end
