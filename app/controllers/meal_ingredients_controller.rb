class MealIngredientsController < ApplicationController
  def new
    @meal_ingredient = MealIngredient.new
    @meal = Meal.find(params[:meal_id])
    @day = Day.find(params[:day_id])
    @meal_type = MealType.find(@meal.meal_type_id)
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @day = Day.find(params[:day_id])
    @meal_ingredient = MealIngredient.new(meal_id: @meal.id)
    @meal_ingredient.ingredient_id = params[:meal_ingredient][:ingredient_id]
    @meal_ingredient.quantity = params[:meal_ingredient][:quantity]
    if @meal_ingredient.save
      add_to_day_categories(@day, @meal_ingredient.ingredient, @meal_ingredient.quantity)
      redirect_to day_meal_path(@day.id, @meal.id)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
    day = Day.find(params[:day_id])
    ingredient = Ingredient.find(params[:id])
    meal = Meal.find(params[:meal_id])
    meal_ingredient = MealIngredient.where(ingredient_id: ingredient.id).find_by_meal_id(meal.id)
    add_to_day_categories(day, ingredient, -meal_ingredient.quantity)
    meal_ingredient.destroy
    redirect_to day_meal_path(day.id, meal.id)
  end

  private

  def add_to_day_categories(day, ingredient, quantity)
    Day::CATEGORIES.each do |category|
      cat = category.to_sym
      day_value = day.send(cat) || 0
      ingredient_value = ingredient.send(cat)
      total_value = day_value += (ingredient_value * (quantity / 100))
      total_value = 0 if total_value.negative?
      day.update_column(cat, total_value)
    end
  end
end
