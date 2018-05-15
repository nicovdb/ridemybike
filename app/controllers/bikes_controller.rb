class BikesController < ApplicationController

  before_action :set_bike, only: [:show]

  def index
    @bikes = policy_scope(Bike)
  end

  def show
    @reservation = Reservation.new
    authorize @bike
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(set_params)
    @bike.user = current_user
    authorize @bike
    if @bike.save
      redirect_to @bike
    else
      render :new
    end
  end

  private

  def set_params
    params.require(:bike).permit(:title, :category, :description, :photo)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
