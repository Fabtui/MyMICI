class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def show
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    @day.user_id = current_user.id
    if @day.save
      redirect_to :root
    else
      render :new
    end
  end

  def update
  end

  def delete
  end

  private

  def day_params
    params.require(:day).permit(:date, :comment, :pain_rate)
  end
end
