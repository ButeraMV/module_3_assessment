class SearchController < ApplicationController
  def index
    binding.pry
    @stores = Search.new(params)
  end
end