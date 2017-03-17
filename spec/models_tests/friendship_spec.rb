require 'rails_helper'

RSpec.describe Friendship, type: :model do
	  context "#validations" do
			it { should validate_presence_of(:user) }
			it { should validate_presence_of(:friend) }
	  end

		context "#associations" do
			it { should belong_to(:user) }
			it { should belong_to(:friend) }
		end
end
