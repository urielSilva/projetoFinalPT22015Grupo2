class ProjectsController < ApplicationController

  before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @projects = Project.all
  end

  def show
    @users = @project.users
    @projects_users = ProjectsUser.where(project_id: @project.id)
  end

  def new
    @project = Project.new
    @users = User.all
  end

  def edit
    # @users = User.all
    # @users_allocated = @project.users
  end

  def create

    @project = Project.new(project_params)

    # params[:users].each do |key,value|
    #       @project.users << User.find(key)
    # end

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'O projeto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update

    params[:users].each do |key,value|
      @project.users << User.find(key)
    end

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'O projeto foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'O projeto foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:description, :price, :link, :project_status_id)
    end
end
