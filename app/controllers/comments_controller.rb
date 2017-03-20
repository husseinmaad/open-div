class CommentsController < ApplicationController
	def new
	end 

  def like
    @company = Company.find(params[:id])
    @company.likes.create!(liker_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end
end