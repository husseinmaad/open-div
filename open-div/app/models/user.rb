class User < ApplicationRecord
  has_many :companies
  has_many :review 
  has_many :likes
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: :friend_id
end
