class Comment < ApplicationRecord
  belongs_to :commentor , class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :likes , as: :likeables

  validates :body, :commentor_id, :commentable_type, :commentable_id, presence: true
end
