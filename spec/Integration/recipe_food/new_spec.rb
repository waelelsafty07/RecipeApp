require 'rails_helper'

RSpec.describe 'recipe_food new view page', type: :system do
  let!(:user) do
    User.create(name: 'test user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  let!(:food1) do
    Food.create(user_id: user.id, name: 'Food 1', measurement_unit: 'Killo', price: 5, quantity: 2)
  end

  let!(:recipe1) do
    Recipe.create(user_id: user.id, name: 'Recipe 1', preparation_time: '2', cooking_time: 5,
                  description: 'just testing', public: true)
  end

  def login_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'show correct form for a user' do
    before(:example) do
      login_as(user)
      visit new_recipe_food_path
    end

    it 'displays a "Name" label in the form' do
      expect(page).to have_content('New Ingredient')
    end
  end

  describe 'show correct form for a user' do
    before(:example) do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
      visit recipe_path(recipe1)
    end
    scenario 'creating a new recipe food' do
      # Click the Add Ingredient link

      click_link 'Add Ingredient'

      # Fill in the form fields
      select Recipe.first.name, from: 'recipe_food_recipe_id'
      fill_in 'recipe_food_quantity', with: 10
      select Food.first.name, from: 'recipe_food_food_id'

      # Submit the form
      click_button 'Create Recipe food'

      # Verify the expected behavior
      expect(page).to have_content('Recipe food was successfully created.')
    end
  end
end
