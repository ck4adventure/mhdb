require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe '#main' do
    it 'returns the main rails view page' do
      get "/main"
      expect(response).to render_template(:main)
      expect(response).to have_http_status(:ok)
    end
  end
end
