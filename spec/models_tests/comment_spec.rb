require 'rails_helper'
# Users can comment on reviews and on comments
RSpec.describe Comment, type: :model do

	  context "#validations" do
			it { should validate_presence_of(:body) }
			it { should validate_presence_of(:commentor_id) }
			it { should validate_presence_of(:commentable_type) }
			it { should validate_presence_of(:commentable_id) }
	  end

		context "#associations" do
			it { should belong_to(:commentor)}
		end
end