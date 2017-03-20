class Company < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :reviews
 

  ratyrate_rateable "culture", "inclusion", "diversity"
  validates :name, :city_name, :region_name, :country_code, presence: true

  # Returns the average rating for the whole company
  # def avg_rating
  #   if self.reviews.any?
  #     sum = self.reviews.reduce(0){|sum,review| sum + review.culture_rating.to_f } / self.reviews.length
  #     sum += self.reviews.reduce(0){|sum,review| sum + review.inclusion_rating.to_f } / self.reviews.length
  #     sum += self.reviews.reduce(0){|sum,review| sum + review.diversity_rating.to_f } / self.reviews.length
  #     return sum / 3
  #   else
  #     return 0
  #   end
  # end
  def avg_rating
    if self.diversity_average && self.inclusion_average && self.inclusion_average
      sum =self.diversity_average.avg
      sum += self.inclusion_average.avg
      sum += self.inclusion_average.avg
      return sum / 3
    end 
    return 0
  end 
  # Takes in search team and finds relevant companies in database
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def reviewed?(user)
    return self.reviews.find_by(reviewer_id: user.id )
  end

  def liked?(user)
    return self.likes.find_by(liker_id: user.id )
  end

end
