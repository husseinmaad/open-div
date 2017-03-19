class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@company = Company.find(params[:company_id])
	end

	def create		
		@company = Company.find(params[:company_id])
		@review = @company.reviews.new (review_params)
		@review.reviewer = current_user	
		binding.pry
		if @review.save
			redirect_to @company
		else
			redirect_back(fallback_location: root_path)
		end
	end

private

	def review_params
		params.require(:review).permit(:body , :culture_rating, :diversity_rating, :inclusion_rating , :anonymous , :company_id , :reviewer_id )
	end

end
