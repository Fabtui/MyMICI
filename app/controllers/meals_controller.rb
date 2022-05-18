class MealsController < ApplicationController
  def index
  end

  def show
    @meal = Meal.find(params[:id])
    @day = Day.find(params[:day_id])
    @meal_ingredient = MealIngredient.new
  end

  def new
    @day = Day.find(params[:day_id])
    @meal = Meal.new
  end

  def create
    @day = Day.find(params[:day_id])
    if @day.meals.where(meal_type_id: params[:meal][:meal_type_id]).count > 0
      @meal = @day.meals.where(meal_type_id: params[:meal][:meal_type_id]).first
      redirect_to day_meal_path(@meal.day.id, @meal.id)
    else
      @meal = Meal.new
      @meal.date = @day.date
      @meal.day_id = @day.id
      @meal.meal_type_id = params[:meal][:meal_type_id]
      if @meal.save
        redirect_to day_meal_path(@meal.day.id, @meal.id)
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    day = Day.find(params[:day_id])
    meal = Meal.find(params[:id])
    meal.destroy
    redirect_to day_path(day.id)
  end
end
