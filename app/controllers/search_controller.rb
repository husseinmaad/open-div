class SearchController < ApplicationController
  layout "search", only: [:index]
  
  def index
    if params[:search]
      @companies = Company.search(params[:search])
      @results_message = "#{@companies.length} results found"
      if @companies.length <= 0
        @results_message = "No results found."
      end
      # if request.xhr?
      #   render :layout => false
      # end
    else
      @companies = Company.all
    end
  end

end
