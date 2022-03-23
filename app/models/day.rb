class Day < ApplicationRecord
  validates :date, presence: true, uniqueness: true
  has_many :pooh
  belongs_to :user
  has_many :meals

  def total_cal
    total = 0
    self.meals.each do |meal|
      meal.ingredients.each do |ingredient|
        total += (ingredient.energykcal * ingredient.meal_ingredients.find_by_meal_id(meal.id).quantity / 100)
      end
    end
    total.round
  end

end
