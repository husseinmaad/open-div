require 'rails_helper'

RSpec.describe Review, type: :model do
	  context "#validations" do
			it { should validate_presence_of(:body) }
			it { should validate_presence_of(:company_id) }
			it { should validate_presence_of(:reviewer_id) }
			# it { should validate_acceptance_of(:anonymous) }
	  end

		context "#associations" do
			it { should belong_to(:reviewer) }
			it { should belong_to(:company) }
			it { should have_many(:comments) }
			it { should have_many(:likes) }
		end
end
