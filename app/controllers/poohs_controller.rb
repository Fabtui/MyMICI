class PoohsController < ApplicationController
  def show
    @pooh = Pooh.find(params[:id])
  end

  def new
    @day = Day.find(params[:day_id])
    @pooh = Pooh.new
  end

  def create
    @pooh = Pooh.new(pooh_params)
    @pooh.day_id = params[:day_id]
    if @pooh.save
      check_if_crisis(Day.find(params[:day_id]))
      redirect_to day_path(params[:day_id])
    else
      render :new
    end
  end

  def edit
    @pooh = Pooh.find(params[:id])
    @day = Day.find(@pooh.day.id)
    check_if_crisis(Day.find(@day))
  end

  def update
    @pooh = Pooh.find(params[:id])
    @pooh.update(pooh_params)
    @day = Day.find(@pooh.day.id)
    redirect_to day_path(@day.id)
  end

  def destroy
    pooh = Pooh.find(params[:id])
    id = pooh.day.id
    pooh.destroy
    redirect_to day_path(id)
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

  def pooh_params
    params.require(:pooh).permit(:blood, :rate)
  end
end
