class FoodsController < ApplicationController
  def show
  end

  def new
    @food = Food.new
    @meal = Meal.find(params[:meal_id])
    @day = Day.find(params[:day_id])
  end

  def create
    @food = Food.new(pooh_params)
    @meal = Meal.find(params[:meal_id])
    @day = Day.find(params[:day_id])
    if @food.save
      MealFood.create!(food_id: @food.id, meal_id: @meal.id)
      redirect_to day_meal_path(@day.id, @meal.id)
    else
      render :new
    end
  end

  def delete
  end

  private

  def pooh_params
    params.require(:food).permit(:name)
  end
end
