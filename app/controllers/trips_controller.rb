# class TripsController < ApplicationController
#
#   def index
#     @trips = Trip.all
#     render json: @trips, status: 200
#   end
#
#   def show
#     @trip = Trip.find(params[:id])
#     render json: @trip, status: 200
#
#   private
#
#   def resource_params
#     params.require(:trip).permit(:date, :total)
#   end
#
# end
