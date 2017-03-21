class Company < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :reviews


  ratyrate_rateable "gender","identity", "management","hr",
  "whole_self","community","leadership","equal_opportunities",
  "promotions","job_description","responsiveness","onsite","overall"
  # ,"culture", "inclusion", "diversity"

  validates :name, :city_name, :region_name, :country_code, presence: true

  # Return overall inclusive rating
  def inclusion_rating
    if self.gender_average && self.identity_average
      sum = self.gender_average.avg + self.identity_average.avg
      sum / 2
    else
      0
    end
  end

  # Return overall culture rating
  def culture_rating
    if self.management_average && self.hr_average && self.whole_self_average && self.community_average
      sum = self.management_average.avg + self.hr_average.avg + self.whole_self_average.avg + self.community_average.avg
      sum / 4
    else
      0
    end
  end

  # Return overall diversity rating
  def diversity_rating
    if self.leadership_average && self.equal_opportunities_average && self.promotions_average
      sum = self.leadership_average.avg + self.equal_opportunities_average.avg + self.promotions_average.avg
      sum / 3
    else
      0
    end
  end

  # Return overall average rating for company

  def avg_rating
    sum = self.diversity_rating
    sum += self.inclusion_rating
    sum += self.culture_rating

    if self.overall_average
      sum += self.overall_average.avg * 2
      sum/5
    else
      sum/3
    end
  end

  # Takes in search team and finds relevant companies in database
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  # Return user if they have reviewed company
  def reviewed?(user)
    return self.reviews.find_by(reviewer_id: user.id )
  end

end
