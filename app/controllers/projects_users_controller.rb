class ProjectsUsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_projects_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = ProjectsUser.ransack(params[:q])
    @projects_users = @search.result(distinct: true).paginate(page: params[:page], per_page: 7)
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

        # Cria histórico de projeto do membro
        @project_member_history = ProjectMemberHistory.new(observation: 'Membro Alocado', user_id: @projects_user.user.id, project_id: @projects_user.project.id, project_role_id: @projects_user.project_role.id)
        @project_member_history.save

        format.html { redirect_to projects_users_url, notice: 'O membro foi alocado com sucesso e foi criado um histórico.' }
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
        format.html { redirect_to @projects_user, notice: 'A alocação foi atualizada com sucesso.' }
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
      format.html { redirect_to (request.referer || admin_path), notice: 'O membro foi deslocado do projeto com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_projects_user
      @projects_user = ProjectsUser.find(params[:id])
    end

    def projects_user_params
      params.require(:projects_user).permit(:project_id, :user_id, :project_role_id)
    end

end
