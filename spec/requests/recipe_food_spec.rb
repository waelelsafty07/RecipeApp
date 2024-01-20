require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/recipe_foods'

      expect(response).to have_http_status(:success)
    end
  end
end
