class SearchController < ApplicationController
  def index
    @stores = Store.get_store_results(params[:search])
  end
end