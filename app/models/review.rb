class Review < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :reviewer, class_name: "User"
  belongs_to :company
  has_many :likes, as: :likeable

  validates :body, :company_id, :reviewer_id, presence: true
  validates :anonymous, acceptance: true

  def liked?(user)
  	return self.likes.find_by(liker_id: user.id )
  end

end
