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

  def new 
    if current_user && current_user.admin == true
      @company = Company.new 
    else 
      redirect_to companies_path
    end 
  end 

  def create
    if current_user && current_user.admin == true
      @company = Company.new(company_params)
      if @company.save
        redirect_to @company 
      else
        render :new 
      end 
    else 
      redirect_to companies_path
    end 
  end 

  def edit
    if current_user && current_user.admin == true 
      @company = Company.find(params[:id])
    else 
      redirect_to companies_path
    end 
  end 

  def update
    if current_user && current_user.admin == true
      @company = Company.find(params[:id])
      @company.update(company_params)
      if @company.save
        redirect_to @company 
      else
        render :edit 
      end 
    else 
      redirect_to companies_path
    end 
  end 

  def destroy
    if current_user && current_user.admin == true 
      @company = Company.find(params[:id])
      @company.delete 
      redirect_to companies_path 
    else 
      redirect_to companies_path
    end 
  end 

  private
  def company_params 
    params.require(:company).permit(:name, :short_description, :domain, :city_name, :region_name, :country_code, :profile_image_url, :creator_id)
  end 
end















