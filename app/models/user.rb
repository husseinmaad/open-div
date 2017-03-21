class User < ApplicationRecord

  has_many :comments , foreign_key: :commentor_id
  has_many :companies , foreign_key: :creator_id
  has_many :reviews , foreign_key: :reviewer_id
  has_many :likes  , foreign_key: :liker_id
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: :friend_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  # validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

 ratyrate_rater
 def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  after_create :welcome_send
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
    redirect_to root_path, alert: "Thank you for register"
  end
end
