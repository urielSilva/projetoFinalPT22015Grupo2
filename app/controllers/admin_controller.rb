class AdminController < ApplicationController

	before_action :authenticate_user!

	def index
		if current_user.profile_id == 1
			redirect_to member_path
		end
	end	

end