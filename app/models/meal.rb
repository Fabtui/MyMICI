class Meal < ApplicationRecord
  belongs_to :day
  has_one :meal_type
  has_many :meal_foods, dependent: :destroy
  has_many :foods, through: :meal_foods
  has_many :meal_ingredients, dependent: :destroy
  has_many :ingredients, through: :meal_ingredients

  def type
    MealType.find(self.meal_type_id).name
  end
end
