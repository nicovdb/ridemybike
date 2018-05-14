class BikesController < ApplicationController

  before_action :set_bike, only: [:show]

  def index
    @bikes = Bike.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(set_params)
    if @bike.save
      redirect_to @bike
    else
      render :new
    end
  end

  private

  def set_params
    params.require(:bike).permit(:title, :category, :description)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
