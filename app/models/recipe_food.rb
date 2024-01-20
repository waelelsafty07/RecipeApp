class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :food_id, uniqueness: { scope: :recipe_id }

  def total_price
    quantity * food.price
  end
end
