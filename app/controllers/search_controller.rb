class SearchController < ApplicationController

  def index
    if params[:search]
      @companies = Company.search(params[:search])

      if @companies.length <= 0
        @results_message = "No results found."
      end
    else
      @companies = Company.all
    end
  end

end
