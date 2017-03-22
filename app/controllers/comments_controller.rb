class CommentsController < ApplicationController
	def new
    @review = Review.find(params[:id])
    @comment = Comment.new
	end 

  def create    
    @review = Review.find(params[:id])
    @comment = @review.comments.new (comments_params)
    @comment.commentor_id = current_user.id
    if @comment.save
      redirect_to review_show_path(@review)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @review = Review.find(params[:review_id])
  end 

  def update
    @comment = Comment.find(params[:id])
    @review = Review.find(params[:review_id])
    @comment.update(comments_params)
    if @comment.save
      redirect_to review_show_path(@review)
    else 
      render :edit
    end 
  end 
  
  def destroy
    @comment = Comment.find(params[:id])
    @review = Review.find(params[:review_id])
    @comment.delete
    redirect_to review_show_path(@review)
  end 
  
  def like
    @comment = Comment.find(params[:id])
    @comment.likes.create!(liker_id: current_user.id)
    if request.xhr?
      render partial: "reviews/show", layout: false, locals: {comment: @comment}
    else 
     redirect_back(fallback_location: root_path)
    end
  end

  def unlike
<<<<<<< HEAD
    @comment = Comment.find(params[:comment_id])
    @like = Like.find(params[:id])
    @like.delete
    @like.delete
    if request.xhr? 
      render partial: "reviews/show", layout: false, locals: {comment: @comment}
    else 
      redirect_back(fallback_location: root_path)
    end 
  end


  private

  def comments_params
    params.require(:comment).permit(:body  ,:anonymous)
  end
end