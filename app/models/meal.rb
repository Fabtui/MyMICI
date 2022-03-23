class Meal < ApplicationRecord
  belongs_to :day
  has_one :meal_type
  has_many :meal_ingredients, dependent: :destroy
  has_many :ingredients, through: :meal_ingredients

  def type
    MealType.find(self.meal_type_id).name
  end
end
