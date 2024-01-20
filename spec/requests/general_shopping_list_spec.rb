require 'rails_helper'

RSpec.describe 'GeneralShoppingLists', type: :request do
  describe 'GET /index' do
    let!(:user1) do
      User.create(name: 'test user', email: 'user@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    let!(:food1) do
      Food.create(user_id: user1.id, name: 'Food 1', measurement_unit: 'Killo', price: 5, quantity: 2)
    end

    let!(:recipe1) do
      Recipe.create(user_id: user1.id, name: 'Recipe 1', preparation_time: '2', cooking_time: 5,
                    description: 'just testing', public: true)
    end

    let!(:ingredient1) do
      RecipeFood.create(food_id: food1.id, recipe_id: recipe1.id, quantity: 2)
    end

    before(:example) do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user1)
    end

    it 'returns a successful response' do
      get '/general_shopping_list', params: { recipe_id: recipe1.id }

      expect(response).to have_http_status(:success)
    end
  end
end
