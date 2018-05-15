class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @bike = Bike.find(params[:bike_id])
    @reservation.bike = @bike
    @reservation.user = current_user
    authorize @bike
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path
    else
      render "bikes/show"
    end
  end

  def index
    @reservations = policy_scope(Reservation.where(user_id: current_user))
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user, :bike, :date, :status, :rating)
  end
end
