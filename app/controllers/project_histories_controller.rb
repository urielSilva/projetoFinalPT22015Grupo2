class ProjectHistoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project_history, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @project_histories = ProjectHistory.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @project_history = ProjectHistory.new
  end

  def edit
  end

  def create
    @project_history = ProjectHistory.new(project_history_params)

    respond_to do |format|
      if @project_history.save
        format.html { redirect_to @project_history, notice: 'O histórico de projeto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @project_history }
      else
        format.html { render :new }
        format.json { render json: @project_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_history.update(project_history_params)
        format.html { redirect_to @project_history, notice: 'O histórico de projeto foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @project_history }
      else
        format.html { render :edit }
        format.json { render json: @project_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_history.destroy
    respond_to do |format|
      format.html { redirect_to project_histories_url, notice: 'O histórico de projeto foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project_history
      @project_history = ProjectHistory.find(params[:id])
    end

    def project_history_params
      params.require(:project_history).permit(:observation, :project_id, :project_status_id)
    end

end
