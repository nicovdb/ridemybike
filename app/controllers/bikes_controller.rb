class BikesController < ApplicationController

  before_action :set_bike, only: [:show]

  def index

    @bikes = policy_scope(Bike)


    if params[:search].present?
      sql_query = " \
        bikes.title @@ :query \
        OR bikes.category @@ :query \
        OR bikes.address @@ :query \
      "
      @bikes = @bikes.where(sql_query, query: "%#{params[:search][:query]} #{params[:search][:category]}%")
    end

    if @bikes.empty?
      @bikes = Bike.near(params[:search][:query], 50)
    end

    @bikes = @bikes.where.not(latitude: nil, longitude: nil)
    @markers = @bikes.map do |bike|
      {
       lat: bike.latitude,
       lng: bike.longitude
      }
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
