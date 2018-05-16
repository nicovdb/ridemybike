class BikesController < ApplicationController

  before_action :set_bike, only: [:show]

  def index

    @bikes = policy_scope(Bike)
    if params.dig(:search, :category).present?
      # @bikes = @bikes.where(address: set_params_search[:address], category: set_params_search[:category]).order(:created_at)
      @bikes = @bikes.where("address ILIKE ?", "%#{params[:search][:address]}%")
        #category: params[:search][:category]).order(:created_at)

    else
      @bikes = policy_scope(Bike)
    end
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
    params.require(:bike).permit(:title, :category, :description, :photo, :address, :category)

  end

  # def set_params_search
  #   params.require(:search).permit(:address, :category)
  # end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
