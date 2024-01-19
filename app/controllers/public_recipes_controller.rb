class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:user, :foods).where(public: true)
  end
end
