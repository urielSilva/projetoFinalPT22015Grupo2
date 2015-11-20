class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show, :edit, :update, :delete]

	#GET/
	def index
		@activities = Activity.all
	end

	#GET /Activities
	def show
		#
	end

	#GET /Activities/new
	def new
		#
		@activity = Activity.new
	end

	#GET /Activities/edit
	def edit
		#
	end

	#POST
	def create
	#
	end

	#PATCH/PUT
	def update
	#
	end

	#DELETE
	def destroy
	#
	end

end

