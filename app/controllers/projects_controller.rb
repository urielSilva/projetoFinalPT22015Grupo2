class ProjectsController < ApplicationController

  before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = Project.ransack(params[:q])
    @projects = @search.result(distinct: true).paginate(page: params[:page], per_page: 7)
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
  end

  def create
    @project = Project.new(project_params)

    # params[:users].each do |key,value|
    #       @project.users << User.find(key)
    # end

    respond_to do |format|
      if @project.save
        # Cria histórico
        @project_history = ProjectHistory.new(observation: 'Projeto Criado', project_id: @project.id, project_status_id: @project.project_status.id)
        @project_history.save
        
        format.html { redirect_to projects_url, notice: 'O projeto foi criado com sucesso e foi criado um histórico.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update

    # params[:users].each do |key,value|
    #   @project.users << User.find(key)
    # end

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
      params.require(:project).permit(:image, :description, :price, :link, :project_status_id)
    end
    
end
