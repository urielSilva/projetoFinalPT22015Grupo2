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

	# POST /activities
  	# POST /activities.json
	def create
		@activity = Activity.new(activity_params)

		respond_to do |format|
			if @activity.save
				format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
				format.json { render :show, status: :created, location: @activity }
			else
				format.html { render :new }
				format.json { render json: @activity.errors, status: :unprocessable_entity }
			end
		end
	end

	#PATCH/PUT
	def update
	#
	end

	#DELETE
	def destroy
	#
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

	 # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:Activity_description)
    end
end

