class Like < ApplicationRecord
  belongs_to :liker, class_name: "User"
  belongs_to :likeable, polymorphic: true

  validates :liker_id, presence: true
end
