class DaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @day = Day.find(params[:id])
    @preferences = current_user.preferences
    require_relative '../data/categories'
    @categories = CATEGORIES
    @alerts = find_alert
    @crises = Crisis.all.sort_by(&:start_date)
    @suspicious_ingredients = Crisis.suspicious_ingredients
    @suspicious_elements = Crisis.suspicious_elements
  end

  def new
    @day = Day.new(date: params[:date])
    @date = params[:date]
  end

  def create
    if params[:format].present?
      @day = Day.new
      @day.date = params[:format]
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
    check_if_crisis(@day)
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
  end

  private

  def check_if_crisis(day)
    if day.pooh.where('blood = true').exists? && day.pain_rate > 6
      return if Crisis.where('start_date < ?', day.date).where('end_date > ?', day.date).exists?
      if Crisis.find_by_start_date(day.date + 1)
        crisis = Crisis.find_by_start_date(day.date + 1)
        crisis.start_date = day.date
        crisis.save
      elsif Crisis.find_by_end_date(day.date - 1)
        crisis = Crisis.find_by_end_date(day.date - 1)
        crisis.start_date = day.date
        crisis.save
      else
        Crisis.create(start_date: day.date, end_date: day.date)
      end
    end
  end

  def find_alert
    if @day.pain_rate && @day.pain_rate > 4
      days = Day.where("date > ?", @day.date - 4).where("date <= ?", @day.date).order(date: :asc).first(3)
      ingredient_alert = []
      categories = @categories.last(@categories.count - 5)
      days.each do |day|
        @categories.last(@categories.count - 5).each do |category|
          total = day.send(category[0].to_sym)
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
