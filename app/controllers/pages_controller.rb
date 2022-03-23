class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    create_day
    date = Date.today.to_s
    @day = Day.find_by_date(date)
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
