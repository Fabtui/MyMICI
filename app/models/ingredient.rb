class Ingredient < ApplicationRecord
  has_many :meal_foods
  has_many :meals, through: :meal_ingredients
end
