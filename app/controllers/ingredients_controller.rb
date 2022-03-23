class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @meal = Meal.find(params[:meal_id])
    @meal_ingredient = @ingredient.meal_ingredients.find_by_meal_id(@meal.id)
  end
end
