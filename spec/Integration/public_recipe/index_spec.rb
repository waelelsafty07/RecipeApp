require 'rails_helper'

RSpec.describe 'recipe_food new view page', type: :system do
  let!(:user) do
    User.create(name: 'test user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
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

  describe 'show all public recipe for a user' do
    before(:example) do
      login_as(user)
      visit public_recipes_path
    end

    it 'displays a "Name" label in the form' do
      expect(page).to have_content(recipe1.name)
    end
  end
end
