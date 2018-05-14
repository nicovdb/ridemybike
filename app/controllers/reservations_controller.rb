class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
  end

  def index
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user, :bike, :date, :status, :rating)
  end
end
