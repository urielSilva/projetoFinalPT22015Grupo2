class ProjectRolesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project_role, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @project_roles = ProjectRole.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @project_role = ProjectRole.new
  end

  def edit
  end

  def create
    @project_role = ProjectRole.new(project_role_params)

    respond_to do |format|
      if @project_role.save
        format.html { redirect_to @project_role, notice: 'A função de projeto foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @project_role }
      else
        format.html { render :new }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_role.update(project_role_params)
        format.html { redirect_to @project_role, notice: 'A função de projeto foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @project_role }
      else
        format.html { render :edit }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_role.destroy
    respond_to do |format|
      format.html { redirect_to project_roles_url, notice: 'A função de projeto foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project_role
      @project_role = ProjectRole.find(params[:id])
    end

    def project_role_params
      params.require(:project_role).permit(:role)
    end
end
