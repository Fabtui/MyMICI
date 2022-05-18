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
      redirect_to day_path(params[:day_id])
    else
      render :new
    end
  end

  def edit
    @pooh = Pooh.find(params[:id])
    @day = Day.find(@pooh.day.id)
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

  def pooh_params
    params.require(:pooh).permit(:blood, :rate)
  end
end
