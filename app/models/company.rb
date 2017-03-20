class Company < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :reviews
  has_many :likes, as: :likeable
  validates :name, :city_name, :region_name, :country_code, presence: true

  # Returns the average rating for the whole company
  def avg_rating
    if self.reviews.any?
      sum = self.reviews.reduce(0){|sum,review| sum + review.culture_rating.to_f } / self.reviews.length
      sum += self.reviews.reduce(0){|sum,review| sum + review.inclusion_rating.to_f } / self.reviews.length
      sum += self.reviews.reduce(0){|sum,review| sum + review.diversity_rating.to_f } / self.reviews.length
      return sum / 3
    else
      return 0
    end
  end
  
  # Takes in search team and finds relevant companies in database
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
