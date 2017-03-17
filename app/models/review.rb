class Review < ApplicationRecord
  has_many :comments, as: :commentable 
  belongs_to :reviewer, class_name: "User"
  belongs_to :company 
  has_many :likes, as: :likeable
end
