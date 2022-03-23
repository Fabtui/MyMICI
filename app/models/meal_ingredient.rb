class MealIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal
  validates :ingredient_id, presence: true
end
