require 'rails_helper'

RSpec.describe Like, type: :model do
		 context "#validations" do
			it { should validate_presence_of(:liker_id) }
	  end
end