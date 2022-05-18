class DaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @day = Day.find(params[:id])
    @preferences = current_user.preferences
    require_relative '../data/categories'
    @categories = CATEGORIES
  end

  def new
    @day = Day.new
    @date = params[:format]
  end

  def create
    if params[:date].present?
      @day = Day.new
      @day.date = params[:date]
    else
      @day = Day.new(day_params)
    end
    @day.user_id = current_user.id
    if @day.save
      redirect_to day_path(@day.id)
    else
      render :new
    end
  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    @day.update(day_params)
    redirect_to day_path(@day)
  end

  def delete
  end

  def details
    require_relative '../data/categories'
    @categories = CATEGORIES
    @day = Day.find(params[:id])
    @ingredients = Ingredient.all
  end

  private

  def day_params
    params.require(:day).permit(:date, :comment, :pain_rate)
  end
end
