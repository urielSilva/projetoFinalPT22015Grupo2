class KnowledgeRequestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_knowledge_request, only: [:show, :edit, :update, :destroy, :aprovar, :recusar]
  load_and_authorize_resource except: [:create]

  def index
    @search = KnowledgeRequest.ransack(params[:q])
    @knowledge_requests = @search.result(distinct: true).includes(:knowledge, :user, :request_status).paginate(page: params[:page], per_page: 7)
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
        format.html { redirect_to @knowledge_request, notice: 'A requisição de conhecimento foi realizada com sucesso.'}
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
      format.html { redirect_to knowledge_requests_url, notice: 'A requisição de conhecimento foi excluída.' }
      format.json { head :no_content }
    end
  end

  # Método que aprova uma requisição de conhecimento, atualizando o status da requisição para "Deferido"
  # Cria uma associação de conhecimento entre o usuário requerente e o conhecimento solicitado
  # Atualiza o histórico de requisição do usuário para "Deferido"
  def aprovar
    respond_to do |format|
      if @knowledge_request.update(request_status_id: 2)

        @request_history = RequestHistory.find_by(knowledge_request: @knowledge_request)
        @request_history.update(request_status_id: 2)

        format.html { redirect_to request.referer, notice: 'A requisição de conhecimento foi aprovada.' }
      end
    end
  end

  # Método que recusa uma requisição do conhecimento, atualizando o status da requisição para "Indeferido"
  # Atualiza o histórico de requisição do usuário para "Indeferido"
  def recusar
    respond_to do |format|
      if @knowledge_request.update(request_status_id: 3)

        @request_history = RequestHistory.find_by(knowledge_request: @knowledge_request)
        @request_history.update(request_status_id: 3)

        format.html { redirect_to request.referer, notice: 'A requisição de conhecimento foi recusada.' }
      end
    end
  end

  private

    def set_knowledge_request
      @knowledge_request = KnowledgeRequest.find(params[:id])
    end

    def knowledge_request_params
      params.require(:knowledge_request).permit(:knowledge_id, :user_id, :request_status_id)
    end

end