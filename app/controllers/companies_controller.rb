class CompaniesController < ApplicationController
  layout "home", only: [:index]
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
  def like
    @company = Company.find(params[:id])
    @company.likes.create!(liker_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

end
