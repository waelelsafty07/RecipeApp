require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/recipes'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get '/recipes/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:user1) do
      User.create(name: 'test user', email: 'user@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    let!(:recipe1) do
      Recipe.create(user_id: user1.id, name: 'Recipe 1', preparation_time: '2', cooking_time: 5, description: 'just testing',
                    public: true)
    end
    before(:example) do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user1)
    end
    it 'returns a successful response' do
      get "/recipes/#{recipe1.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
