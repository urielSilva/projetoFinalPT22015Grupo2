class ProjectsUsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_projects_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @projects_users = ProjectsUser.all
  end

  def show
  end

  def new
    @projects_user = ProjectsUser.new
  end

  def edit
  end

  def create
    @projects_user = ProjectsUser.new(projects_user_params)

    respond_to do |format|
      if @projects_user.save
        format.html { redirect_to @projects_user, notice: 'Projects user was successfully created.' }
        format.json { render :show, status: :created, location: @projects_user }
      else
        format.html { render :new }
        format.json { render json: @projects_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @projects_user.update(projects_user_params)
        format.html { redirect_to @projects_user, notice: 'Projects user was successfully updated.' }
        format.json { render :show, status: :ok, location: @projects_user }
      else
        format.html { render :edit }
        format.json { render json: @projects_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @projects_user.destroy
    respond_to do |format|
      format.html { redirect_to projects_users_url, notice: 'Projects user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_projects_user
      @projects_user = ProjectsUser.find(params[:id])
    end

    def projects_user_params
      params.require(:projects_user).permit(:project_id, :user_id)
    end
end
