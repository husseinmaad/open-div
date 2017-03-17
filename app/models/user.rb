class User < ApplicationRecord
	has_many :companies
  has_many :review 
  has_many :likes
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: :friend_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
