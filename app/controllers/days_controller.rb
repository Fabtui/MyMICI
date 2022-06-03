class DaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @day = Day.find(params[:id])
    @preferences = current_user.preferences
    require_relative '../data/categories'
    @categories = CATEGORIES
    @alerts = find_alert
  end

  def new
    @day = Day.new
    @date = params[:format]
  end

  def create
    if params[:date].present?
      @day = Day.new
      raise
      @day.date = params[:date]
    else
      raise
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

  def alert_details
    @day = Day.find(params[:id])
    @days = Day.where("date > ?", @day.date - 4).where("date <= ?", @day.date).order(date: :asc).first(3)
    @categories = CATEGORIES
    @alerts = find_alert
    # @meals = []
    # days.each do |day|
    #   @meals += Meal.where(day_id: day.id)
    # end
    # @ingredients = []
    # @meals.each do |meal|
    #   ingredients += meal.ingredients
    #   raise
    # end
  end


  private

  def find_alert
    if @day.pain_rate && @day.pain_rate > 4
      days = Day.where("date > ?", @day.date - 4).where("date <= ?", @day.date).order(date: :asc).first(3)
      ingredient_alert = []
      days.each do |day|
        @categories.last(@categories.count - 5).each do |category|
          total = day.total(category[0])
          ingredient_alert.push(category[0]) if total > category[2]
        end
      end
      return ingredient_alert.uniq
    end
  end

  def day_params
    params.require(:day).permit(:date, :comment, :pain_rate)
  end
end
