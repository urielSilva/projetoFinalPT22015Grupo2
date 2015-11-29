class AdminController < ApplicationController

	before_action :authenticate_user!

	def index
		unless current_user.admin?
			redirect_to member_path
		end
	end	

end