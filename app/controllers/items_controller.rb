class ItemsController < ApplicationController

  def index
    render json: Item.all, status: 200
  end

  def csv_upload
    # TODO - first load items and ask user to confirm they want to upload
    # TODO - add download of blank form with headers
    Item.import_from_csv(params[:file])
  end

  private

  def resource_params
    params.require(:item).permit(:trip_id, :date, :description, :qty, :price)
  end

end
