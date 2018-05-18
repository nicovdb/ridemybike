class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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

    @bikes = @bikes.where.not(latitude: nil, longitude: nil).order(created_at: :desc)
    image = ActionController::Base.helpers.asset_path("logo_velo_small.png")
    @markers = @bikes.map do |bike|
      {
       lat: bike.latitude,
       lng: bike.longitude,
       icon: image
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
      sleep 1
      redirect_to bikes_path
    else
      sleep 1
      render :new
    end
  end

  def collection
    @bike = Bike.new
    authorize @bike

    @user = current_user
    @user_bikes = @user.bikes.order(created_at: :desc)
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
