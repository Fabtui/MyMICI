class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
  end

  def new
    @day = Day.new
    @date = params[:format]
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
    redirect_to day_path(@day)
  end

  def delete
  end

  private

  def day_params
    params.require(:day).permit(:date, :comment, :pain_rate)
  end
end
