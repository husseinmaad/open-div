class SearchController < ApplicationController

  def index
    if params[:search]
      @companies = Company.search(params[:search])
    else
      @companies = Company.all
    end
  end

end
