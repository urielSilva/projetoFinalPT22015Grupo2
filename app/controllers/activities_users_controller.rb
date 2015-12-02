class ActivitiesUsersController < ApplicationController
  before_action :set_activities_user, only: [:show, :edit, :update, :destroy]

  # GET /activities_users
  # GET /activities_users.json
  def index
    @activities_users = ActivitiesUser.all
  end

  # GET /activities_users/1
  # GET /activities_users/1.json
  def show
  end

  # GET /activities_users/new
  def new
    @activities_user = ActivitiesUser.new
  end

  # GET /activities_users/1/edit
  def edit
  end

  # POST /activities_users
  # POST /activities_users.json
  def create
    @activities_user = ActivitiesUser.new(activities_user_params)

    respond_to do |format|
      if @activities_user.save
        format.html { redirect_to @activities_user, notice: 'Activities user was successfully created.' }
        format.json { render :show, status: :created, location: @activities_user }
      else
        format.html { render :new }
        format.json { render json: @activities_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities_users/1
  # PATCH/PUT /activities_users/1.json
  def update
    respond_to do |format|
      if @activities_user.update(activities_user_params)
        format.html { redirect_to @activities_user, notice: 'Activities user was successfully updated.' }
        format.json { render :show, status: :ok, location: @activities_user }
      else
        format.html { render :edit }
        format.json { render json: @activities_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities_users/1
  # DELETE /activities_users/1.json
  def destroy
    @activities_user.destroy
    respond_to do |format|
      format.html { redirect_to activities_users_url, notice: 'Activities user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activities_user
      @activities_user = ActivitiesUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activities_user_params
      params.require(:activities_user).permit(:user_id, :activity_id)
    end
end
