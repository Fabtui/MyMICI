class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # require 'json'
    # json_url = File.read('./app/data/ingredients.json')
    # json = JSON.parse(json_url)
    # query = 'Vodka'
    # ingredient = (json.select { |element| element['name'] === query }).first
    # keys = ingredient.keys
    create_day
    date = Date.today.to_s
    @day = Day.find_by_date(date)
    @preferences = current_user.preferences
    require_relative '../data/categories'
    @categories = CATEGORIES
    @crises = Crisis.all
  end

  def chart
    if params["/chart"].present?
      str_start_date = "#{params["/chart"]["start_date(1i)"]}-#{params["/chart"]["start_date(2i)"]}-#{params["/chart"]["start_date(3i)"]}"
      str_end_date = "#{params["/chart"]["end_date(1i)"]}-#{params["/chart"]["end_date(2i)"]}-#{params["/chart"]["end_date(3i)"]}"
      start_date = Date.parse str_start_date
      end_date = Date.parse str_end_date
      days = Day.all.select { |day| day.date >= start_date }
      @days = days.select { |day| day.date <= end_date }
    else
      @days = Day.all.select { |day| day.date >= (Date.today - 30) }
    end
      @preferences = current_user.preferences
      require_relative '../data/categories'
      @categories = CATEGORIES
  end

  private

  def create_day
    date = Date.today.to_s
    if Day.find_by_date(date).present?
      @day = Day.find_by_date(date)
    else
      @day = Day.new(date: date, user_id: current_user.id)
      @day.save
    end
  end
end
