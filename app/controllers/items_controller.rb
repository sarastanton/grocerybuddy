class ItemsController < ApplicationController

  def create
    @item = Item.new(resource_params)
    if @item.save
     render json: @item, status: 200
   else
     render json: { message: @item.errors }, status: 400
   end
  end

  def index
    @items = Item.order('description ASC, date DESC') if params[:sort] == "description"
    @items = Item.order('date DESC') if params[:sort] == "date"
    render json: @items, status: 200
  end

  def csv_upload
    # TODO - first load items and ask user to confirm they want to upload
    # TODO - add download of blank form with headers
    Item.import_from_csv(params[:file])
  end

  private

  def resource_params
    params.require(:item).permit(:date, :description, :price)
  end

end
