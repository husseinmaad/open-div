class CompaniesController < ApplicationController
  def index
    #@companies = sorted_companies # helper method
    # @companies = Company.all
    @companies= top_four
    if params[:search]
      @companies = Company.search(params[:search])
    else
      @companies
    end
  end 

  def show
    @company = Company.find(params[:id])
  end 
end
