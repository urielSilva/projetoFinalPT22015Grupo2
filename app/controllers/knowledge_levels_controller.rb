class KnowledgeLevelsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_knowledge_level, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = KnowledgeLevel.ransack(params[:q])
    @knowledge_levels = @search.result(distinct: true).paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @knowledge_level = KnowledgeLevel.new
  end

  def edit
  end

  def create
    @knowledge_level = KnowledgeLevel.new(knowledge_level_params)

    respond_to do |format|
      if @knowledge_level.save
        format.html { redirect_to @knowledge_level, notice: 'O nível de conhecimento foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @knowledge_level }
      else
        format.html { render :new }
        format.json { render json: @knowledge_level.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @knowledge_level.update(knowledge_level_params)
        format.html { redirect_to @knowledge_level, notice: 'O nível de conhecimento foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @knowledge_level }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @knowledge_level.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_levels_url, notice: 'O nível de conhecimento foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_knowledge_level
      @knowledge_level = KnowledgeLevel.find(params[:id])
    end

    def knowledge_level_params
      params.require(:knowledge_level).permit(:level, :description)
    end

end