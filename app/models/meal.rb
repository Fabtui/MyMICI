class Meal < ApplicationRecord
  belongs_to :day
  has_one :meal_type

  def type
    MealType.find(self.meal_type_id).name
  end
end
