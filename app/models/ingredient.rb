class Ingredient < ApplicationRecord
  has_many :meals, through: :meal_ingredients
end
