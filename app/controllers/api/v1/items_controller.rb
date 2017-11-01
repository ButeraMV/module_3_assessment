class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render status: 200, json: @items
  end

  def show
    @item = Item.find(params[:id])
    render status: 200, json: @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    render status: 204, json: { message: "Item successfully deleted" }
  end
end