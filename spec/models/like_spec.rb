require 'rails_helper'

RSpec.describe Like, type: :model do
		context "# validations" do
			# let!(:review) { Review.create! }
			# let!(:review_like) { Like.create! liker_id: 1, likeable_type: "Review", likeable_id: review.id }
			it { should validate_presence_of(:liker_id) }
			it { should validate_presence_of(:likeable_id) }
			it { should validate_presence_of(:likeable_type) }
			it { should validate_uniqueness_of(:liker_id).scoped_to(:likeable_type, :likeable_id) }
	  end

		context "# association" do
			it { should belong_to(:liker) }
			it { should belong_to(:likeable) }
	  end
end
