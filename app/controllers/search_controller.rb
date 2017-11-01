class SearchController < ApplicationController
  def index
    @stores = Search.get_store_results(params[:search])
  end
end