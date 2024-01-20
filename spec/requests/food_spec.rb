require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/foods'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get '/foods/new'

      expect(response).to have_http_status(:success)
    end
  end
end
