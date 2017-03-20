class CommentsController < ApplicationController
	def new
    @review = Review.find(params[:id])
    @comment = Comment.new
	end 

  def create    
    @review = Review.find(params[:id])
    @comment = Comment.new (comments_params)
    if @comment.save
      redirect_to review_show_path(@review)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def like
    @company = Company.find(params[:id])
    @company.likes.create!(liker_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end
  private

  def comments_params
    params.require(:comment).permit(:body  ,:anonymous)
  end
end