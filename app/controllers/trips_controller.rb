class TripsController < ApplicationController

  def index
    render json: Trip.all, status: 200
  end

  private

  def resource_params
    params.require(:trip).permit(:date, :total)
  end

end
