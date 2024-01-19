Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods, only: [:index,:new,:create, :edit, :destroy]
  resources :recipes, only: [:index,:new,:create,:show,:destroy]
  resources :foods 
  resources :users
  patch 'recipes/:id/toggle_public', to: 'recipes#toggle_public', as: 'toggle_public'
  get 'public_recipes', to: 'public_recipes#index'
  get 'general_shopping_list', to: 'general_shopping_list#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
