class ProjectMemberHistoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project_member_history, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = ProjectMemberHistory.ransack(params[:q])
    @project_member_histories = @search.result(distinct: true).includes(:user, :project, :project_role).paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @project_member_history = ProjectMemberHistory.new
  end

  def edit
  end

  def create
    @project_member_history = ProjectMemberHistory.new(project_member_history_params)

    respond_to do |format|
      if @project_member_history.save
        format.html { redirect_to @project_member_history, notice: 'O histórico de projeto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @project_member_history }
      else
        format.html { render :new }
        format.json { render json: @project_member_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_member_history.update(project_member_history_params)
        format.html { redirect_to @project_member_history, notice: 'O histórico de projeto foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @project_member_history }
      else
        format.html { render :edit }
        format.json { render json: @project_member_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_member_history.destroy
    respond_to do |format|
      format.html { redirect_to project_member_histories_url, notice: 'O histórico de projeto foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project_member_history
      @project_member_history = ProjectMemberHistory.find(params[:id])
    end

    def project_member_history_params
      params.require(:project_member_history).permit(:observation, :project_id, :user_id, :project_role_id)
    end
end