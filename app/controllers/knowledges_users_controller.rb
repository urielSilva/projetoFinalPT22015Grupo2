class KnowledgesUsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_knowledges_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = KnowledgesUser.joins(:knowledge, :user).ransack(params[:q])
    @knowledges_users = @search.result(distinct: true).includes(:knowledge, :user).paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @knowledges_user = KnowledgesUser.new
  end

  def edit
  end

  def create
    @knowledges_user = KnowledgesUser.new(knowledges_user_params)

    respond_to do |format|
      if @knowledges_user.save
        format.html { redirect_to @knowledges_user, notice: 'A associação do conhecimento com o membro foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @knowledges_user }
      else
        format.html { render :new }
        format.json { render json: @knowledges_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @knowledges_user.update(knowledges_user_params)
        format.html { redirect_to @knowledges_user, notice: 'A associação do conhecimento com o membro foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @knowledges_user }
      else
        format.html { render :edit }
        format.json { render json: @knowledges_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @knowledges_user.destroy
    respond_to do |format|
      format.html { redirect_to knowledges_users_url, notice: 'A associação do conhecimento com o membro foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_knowledges_user
      @knowledges_user = KnowledgesUser.find(params[:id])
    end

    def knowledges_user_params
      params.require(:knowledges_user).permit(:user_id, :knowledge_id)
    end
    
end