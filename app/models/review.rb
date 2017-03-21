class Review < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :reviewer, class_name: "User"
  belongs_to :company
  has_many :likes, as: :likeable

  validates :body, :company_id, :reviewer_id, presence: true
  validates :anonymous, inclusion: { in: [ true, false ] }

  def liked?(user)
  	return self.likes.find_by(liker_id: user.id )
  end


  def rating_for_user(dimension = nil, options = {})
    @object = self.company
    @user   = self.reviewer
	  @rating = Rate.find_by_rater_id_and_rateable_id_and_dimension(@user.id, @object.id, dimension)
	  stars = @rating ? @rating.stars : 0
	end



end
