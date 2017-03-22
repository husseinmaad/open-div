class UsersController < ApplicationController
	def index
	end 

	def show
		@user = current_user
		@reviews = @user.reviews
	end


end
