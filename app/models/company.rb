class Company < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :reviews

  validates :name, :city_name, :region_name, :country_code, presence: true
end
