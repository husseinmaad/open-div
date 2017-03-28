module ReviewsHelper

    def multiple_dimension_avg_rating

     ratings = Rate.where("rateable_type = ? and rateable_id = ?", "Company", self.id)

     sum = ratings.reduce(0){|sum , r| sum+= r.stars}

     sum/ratings.length

    end



	def custom_rating_for_review ( review )
    @object = review.company
    @user   = review.reviewer


    @ratings =  Rate.where("rateable_type = ? and rateable_id = ?", "Company", @object.id)
    @user_ratings = []

    @ratings.each do |rate|
        if rate.rater_id == @user.id
            @user_ratings<< rate
        end
    end
    sum = @user_ratings.reduce(0){|sum , r| sum+= r.stars}
    average = sum/@user_ratings.length

    end


end
