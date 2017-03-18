class Company < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :reviews

  
end
