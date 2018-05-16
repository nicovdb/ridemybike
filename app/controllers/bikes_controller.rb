class BikesController < ApplicationController

  before_action :set_bike, only: [:show]

  def index
    @bikes = policy_scope(Bike)

    @bikes_map = Bike.where.not(latitude: nil, longitude: nil)

    @markers = @bikes_map.map do |bike|
      {
       lat: bike.latitude,
       lng: bike.longitude#,
       # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
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
    params.require(:bike).permit(:title, :category, :description, :photo)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
