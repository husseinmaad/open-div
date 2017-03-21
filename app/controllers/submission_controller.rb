class SubmissionController < ApplicationController
  def new
  	if current_user == true
      @submission = Submission.new 
    else 
      redirect_to submissions_path
    end 
  end

  def create
  	if current_user == true
      @submission = Submission.new(submission_params)
    if @submission.save
      redirect_to @submission 
    else
      render :new 
      end 
    else 
      redirect_to submissions_path
    end 

  end
end
