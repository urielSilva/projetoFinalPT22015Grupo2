class MemberController < ApplicationController

	before_action :authenticate_user!

	def index
		if current_user.profile_id == 2
			redirect_to admin_path
		end
	end	

end