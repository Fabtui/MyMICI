class MealsController < ApplicationController
  def index
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @day = Day.find(params[:day_id])
    @meal = Meal.new
  end

  def create
    @day = Day.find(params[:day_id])
    @meal = Meal.new
    @meal.date = @day.date
    @meal.day_id = @day.id
    @meal.meal_type_id = params[:meal][:meal_type_id]
    if @meal.save
      redirect_to day_path(@day.id)
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
