class PoohsController < ApplicationController
  def new
    @day = Day.find(params[:day_id])
    @pooh = Pooh.new
  end

  def create
    @pooh = Pooh.new(pooh_params)
    @pooh.day_id = params[:day_id]
    if @pooh.save
      redirect_to day_path(params[:day_id])
    else
      render :new
    end
  end

  def update
  end

  def delete
  end

  private

  def pooh_params
    params.require(:pooh).permit(:blood, :rate)
  end
end
