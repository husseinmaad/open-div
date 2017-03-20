class Like < ApplicationRecord
  belongs_to :liker, class_name: "User"
  belongs_to :likeable, polymorphic: true

  validates :liker_id, :likeable_type, :likeable_id, :presence => true
  validates :liker_id, uniqueness: { scope: [:likeable_type, :likeable_id] }
end
