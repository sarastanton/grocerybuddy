class ItemsController < ApplicationController

  def index
    render json: Item.all, status: 200
  end

  private

  def resource_params
    params.require(:item).permit(:trip_id, :date, :description, :qty, :price)
  end

end
