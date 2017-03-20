class Comment < ApplicationRecord
  belongs_to :commentor , class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :likes , as: :likeables


  def liked?(user)
    return self.likes.find_by(liker_id: user.id )
  end
  
end
