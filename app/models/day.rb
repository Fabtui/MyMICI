class Day < ApplicationRecord
  validates :date, presence: true, uniqueness: true
  has_many :pooh
  belongs_to :user
  has_many :meals

  def total(key)
    require "json"
    total = 0
    ingredients_json = JSON.parse(File.read("./app/data/ingredients-json.json"))
    self.meals.each do |meal|
      meal.ingredients.each do |ingredient|
        ingredient_json = (ingredients_json.select { |c| c['name'] == ingredient.name }).first
        total += (ingredient_json[key].to_i * ingredient.meal_ingredients.find_by_meal_id(meal.id).quantity / 100)
      end
    end
    total.round
  end

end
