require 'rails_helper'

RSpec.describe Company, type: :model do

	  context "#validations" do
			it { should validate_presence_of(:name) }
			it { should validate_presence_of(:website) }
			it { should validate_presence_of(:industry) }
			it { should validate_presence_of(:location) }
			it { should validate_presence_of(:logo) }
			it { should belong_to(:creator_id)}
	  end

end
