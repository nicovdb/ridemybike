class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    date_begin = params[:reservation][:date_begin]
    date_end = params[:reservation][:date_end]
    @reservation.date_begin = DateTime.strptime(date_begin, '%m/%d/%Y')
    @reservation.date_end = DateTime.strptime(date_end, '%m/%d/%Y')
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

  def accepted
    @reservation = Reservation.find(params[:id])
    @reservation.status = true
    authorize @reservation
    @reservation.save
    redirect_to reservations_path
  end

  def refused
    @reservation = Reservation.find(params[:id])
    @reservation.status = false
    authorize @reservation
    @reservation.save
    redirect_to reservations_path
  end
  private

  def reservation_params
    params.require(:reservation).permit(:user, :bike, :status, :rating)
  end
end
