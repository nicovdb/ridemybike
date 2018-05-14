class BikesController < ApplicationController

  before_action :set_bike, only: [:show]

  def index
    @bikes = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create

  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
