require 'rails_helper'

RSpec.describe 'food new view page', type: :system do
  let!(:user) do
    User.create(name: 'test user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  let!(:food1) do
    Food.create(user_id: user.id, name: 'Food 1', measurement_unit: 'Killo', price: 5, quantity: 2)
  end
  let!(:food2) do
    Food.create(user_id: user.id, name: 'Food 2', measurement_unit: 'Killo', price: 5, quantity: 2)
  end
  let!(:food3) do
    Food.create(user_id: user.id, name: 'Food 3', measurement_unit: 'Killo', price: 5, quantity: 2)
  end

  let!(:recipe1) do
    Recipe.create(user_id: user.id, name: 'Recipe 1', preparation_time: '2', cooking_time: 5,
                  description: 'just testing', public: true)
  end

  let!(:ingredient1) do
    RecipeFood.create(food_id: food1.id, recipe_id: recipe1.id, quantity: 2)
  end

  let!(:ingredient2) do
    RecipeFood.create(food_id: food2.id, recipe_id: recipe1.id, quantity: 4)
  end

  let!(:ingredient2) do
    RecipeFood.create(food_id: food2.id, recipe_id: recipe1.id, quantity: 8)
  end

  describe 'show correct form for a user' do
    before(:example) do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
      visit general_shopping_list_path(recipe_id: recipe1.id)
    end

    it 'displays the recipe\'s name' do
      expect(page).to have_content("Shopping List for #{recipe1.name}")
    end
  end
end
