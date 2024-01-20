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

  describe 'show correct form for a user' do
    before(:example) do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
      visit foods_path
    end

    it 'displays the food\'s name' do
      expect(page).to have_content(food1.name)
    end

    it 'displays the food\'s measurement_unit' do
      expect(page).to have_content(food1.measurement_unit)
    end

    it 'displays the food\'s price' do
      expect(page).to have_content(food1.price)
    end

    it 'displays the food\'s name' do
      expect(page).to have_content(food2.name)
    end

    it 'displays the food\'s measurement_unit' do
      expect(page).to have_content(food2.measurement_unit)
    end

    it 'displays the food\'s price' do
      expect(page).to have_content(food2.price)
    end

    it 'displays the food\'s name' do
      expect(page).to have_content(food3.name)
    end

    it 'displays the food\'s measurement_unit' do
      expect(page).to have_content(food3.measurement_unit)
    end

    it 'displays the food\'s price' do
      expect(page).to have_content(food3.price)
    end
  end
end
