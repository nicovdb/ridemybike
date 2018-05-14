class BikesController < ApplicationController
  def index

  end

  def show

  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(set_params)
  end

  private

  def set_params
    params.require(:bike).permit(:title, :category, :description)
  end
end
