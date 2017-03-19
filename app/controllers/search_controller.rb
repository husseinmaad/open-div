class SearchController < ApplicationController

  def index
    if params[:search]
      @companies = Company.search(params[:search])
      @results_message = "#{@companies.length} results found"
      if @companies.length <= 0
        @results_message = "No results found."
      end
    else
      @companies = Company.all
    end
  end

end
