class SearchController < ApplicationController
  def index
    @stores = Store.get_store_results(params[:search])
    @store_count = Store.get_count(params[:search])
  end
end