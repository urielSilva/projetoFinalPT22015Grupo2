class KnowledgeRequestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_knowledge_request, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = KnowledgeRequest.ransack(params[:q])
    @knowledge_requests = @search.result(distinct: true).paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @knowledge_request = KnowledgeRequest.new
  end

  def edit
  end

  def create
    @knowledge_request = KnowledgeRequest.new(knowledge_request_params)

    respond_to do |format|
      if @knowledge_request.save
        format.html { redirect_to @knowledge_request, notice: 'A requisição de conhecimento foi feita.'}
        format.json { render :show, status: :created, location: @knowledge_request }
      else
        format.html { render :new }
        format.json { render json: @knowledge_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @knowledge_request.update(knowledge_request_params)
        format.html { redirect_to @knowledge_request, notice: 'A requisição de conhecimento foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @knowledge_request }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @knowledge_request.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_requests_url, notice: 'A requisição de conhecimento foi recusada.' }
      format.json { head :no_content }
    end
  end

  private

    def set_knowledge_request
      @knowledge_request = KnowledgeRequest.find(params[:id])
    end

    def knowledge_request_params
      params.require(:knowledge_request).permit(:knowledge_id, :user_id)
    end

end