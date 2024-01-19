require 'rails_helper'

RSpec.describe 'Recipe index view page', type: :system do
  let!(:user1) do
    User.create(name: 'test user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  let!(:recipe1) do
    Recipe.create(user_id: user1.id, name: 'Recipe 1', preparation_time: '2', cooking_time: 5,
                  description: 'just testing', public: true)
  end
  let!(:recipe2) do
    Recipe.create(user_id: user1.id, name: 'Recipe 2', preparation_time: '2', cooking_time: 5,
                  description: 'just testing', public: true)
  end
  let!(:recipe3) do
    Recipe.create(user_id: user1.id, name: 'Recipe 3', preparation_time: '2', cooking_time: 5,
                  description: 'just testing', public: true)
  end

  describe 'show correct form for a user' do
    before(:example) do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user1)
      visit recipes_path
    end

    it 'displays the Recipe\'s name' do
      expect(page).to have_content(recipe1.name)
    end

    it 'displays the recipe\'s description' do
      expect(page).to have_content(recipe1.description)
    end

    it 'displays the recipe\'s name' do
      expect(page).to have_content(recipe2.name)
    end

    it 'displays the recipe\'s description' do
      expect(page).to have_content(recipe2.description)
    end

    it 'displays the recipe\'s name' do
      expect(page).to have_content(recipe3.name)
    end

    it 'displays the recipe\'s description' do
      expect(page).to have_content(recipe3.description)
    end
  end
end
