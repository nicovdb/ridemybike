class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @bike = Bike.find(params[:bike_id])
    @reservation.bike = @bike
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path
    else
      render "bikes/:id/show"
    end
  end
  def index
    @reservations = Reservation.where(user_id: current_user)
  end
  private
  def reservation_params
    params.require(:reservation).permit(:user, :bike, :date, :status, :rating)
  end
end
