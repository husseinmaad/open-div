class SearchController < ApplicationController

  def index
    if params[:search]
      @companies = Company.search(params[:search])
      @results_message = "#{@companies.length} results found"
      if @companies.length <= 0
        @results_message = "No results found."
      end
      respond_to do |format|
          # format.html { redirect_to search_path}
          format.js   { redirect_to search_path }
      end
    else
      @companies = Company.all
    end
  end

end
