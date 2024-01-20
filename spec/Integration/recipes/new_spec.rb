require 'rails_helper'

RSpec.describe 'Recipe new view page', type: :system do
  let!(:user) do
    User.create(name: 'test user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
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
      visit new_recipe_path
    end

    it 'displays a "Name" label in the form' do
      expect(page).to have_content('Name')
    end

    it 'displays a "Preparation time" label in the form' do
      expect(page).to have_content('Preparation time')
    end

    it 'displays a "Description" label in the form' do
      expect(page).to have_content('Description')
    end

    it 'displays a "Cooking time" label in the form' do
      expect(page).to have_content('Cooking time')
    end
  end
end
