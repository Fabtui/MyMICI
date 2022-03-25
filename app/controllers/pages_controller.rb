class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    create_day
    date = Date.today.to_s
    @day = Day.find_by_date(date)
  end

  def chart
    @days = Day.all

    # def chart(markets)
    #   chart_data = markets.map{ |m| [name: m['runner'], data: m['histories'].map{|h| [h['created_at'], 1/h['price']]}]}.flatten
    #   line_chart chart_data.each do |m|
    #     [{name: [:name], data: [:data]}]
    #   end
    # end
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
