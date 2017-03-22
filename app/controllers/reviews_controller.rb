class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@company = Company.find(params[:company_id])
	end

	def create		
		@company = Company.find(params[:company_id])
		@review = @company.reviews.new (review_params)
		@review.reviewer = current_user	
		if @review.save
			redirect_to @company
		else
			redirect_back(fallback_location: root_path)
		end
	end


	def show
		@review = Review.find(params[:id])
		@company = @review.company
		@user = @review.reviewer 
	end 

	def edit
		@review = Review.find(params[:id])
		@company = @review.company
	end 

	def update
		@review = Review.find(params[:id])
		@company = @review.company 
		@review.update(review_params)
		if @review.save
			redirect_to review_show_path(@review)
		else 
			render :edit
		end 
	end 

	def like
		@review = Review.find(params[:id])
		@review.likes.create!(liker_id: current_user.id)
		if request.xhr?
			render partial: "companies/show", layout: false, locals: {review: @review}
		else 
			redirect_back(fallback_location: root_path)
		end 
	end

	def unlike
		@like = Like.find(params[:id])
		@like.delete
		if request.xhr?
			render partial: "companies/show", layout: false, locals: {review: @review}
		else 
			redirect_back(fallback_location: root_path)
		end 
	end

	def destroy
		@review = Review.find(params[:id])
		@comany = @review.company 
		@review.destroy
		redirect_to @comany 
	end 



private

	def review_params
		params.require(:review).permit(:body , :culture_rating, :diversity_rating, :inclusion_rating , :anonymous , :company_id , :reviewer_id )
	end

end
