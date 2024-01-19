class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true

  def total_price
    total = 0
    foods.each do |food|
      total += food.price * food.quantity
    end
    total
  end
end
