class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :create_day

  def home
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
