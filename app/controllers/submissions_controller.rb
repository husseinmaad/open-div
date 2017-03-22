class SubmissionsController < ApplicationController
  def new
      @submission = Submission.new 
  end

  def create
      @submission = Submission.new(submission_params)
    if @submission.save
      p"*"*100
      p current_user
      p "*"*100
        #send email to the user
      CompanyMailer.submit_company_email(current_user).deliver
      redirect_to root_path 
    else
      render 'new'
    end 
	end

	private
	def submission_params
		params.require(:submission).permit(:name, :short_description, :domain, :city_name, :region_name, :country_code, :avatar, :user_id)
	end
end
