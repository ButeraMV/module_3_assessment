class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render status: 200, json: @items
  end
end