class MealIngredientsController < ApplicationController
  def new
    @meal_ingredient = MealIngredient.new
    @meal = Meal.find(params[:meal_id])
    @day = Day.find(params[:day_id])
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @day = Day.find(params[:day_id])
    @meal_ingredient = MealIngredient.new(meal_id: @meal.id)
    @meal_ingredient.ingredient_id = params[:meal_ingredient][:ingredient_id]
    if @meal_ingredient.save
      redirect_to day_meal_path(@day.id, @meal.id)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def delete
  end
end
