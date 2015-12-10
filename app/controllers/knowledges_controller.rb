class KnowledgesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_knowledge, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  # Na index, como há um formulário de busca, é necessário filtrar 
  # os resultados a partir dos parâmetros enviados do formulário
  # A paginação é feita de 7 em 7 registros
  def index
    @search = Knowledge.ransack(params[:q])
    @knowledges = @search.result(distinct: true).includes(:technology, :knowledge_level).paginate(page: params[:page], per_page: 7)
  end

  def new
    @knowledge = Knowledge.new
  end

  def edit
  end

  def create
    @knowledge = Knowledge.new(knowledge_params)

    respond_to do |format|
      if @knowledge.save
        format.html { redirect_to @knowledge, notice: 'O conhecimento foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @knowledge }
        else
          format.html { render :new }
          format.json { render json: @knowledge_level, status: :unprocessable_entity }
        end
      end
    end

  def update
    respond_to do |format|
      if @knowledge.update(knowledge_params)
        format.html { redirect_to @knowledge, notice: 'O conhecimento foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @knowledge }
      else
        format.html { render :edit }
          format.json { render json: @knowledge.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy 
    @knowledge.destroy
    respond_to do |format|
      format.html { redirect_to knowledges_url, notice: 'O conhecimento foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  # Esse método cria uma requisição de conhecimento do usuário atual e o conhecimento escolhido
  # O administrador é definido antes de se criar a requisição, para que o conhecimento seja diretamente associado a ele
  def requisitar

    # Recupera todos os administradores
    @admins = recupera_admins
    
    # Se houver um admin igual ao usuário atual
    if @admins.include?(current_user)
      # Associa conhecimento diretamente

      respond_to do |format|
        format.html {redirect_to knowledges_url, notice: 'O conhecimento foi associado com sucesso.'}
      end

    else 

      # Senão cria uma requisição para que o administrador possa aprovar (Requisição tem como padrão o status 'Em análise')
      @knowledge_request = KnowledgeRequest.new(user_id: current_user.id, knowledge_id: @knowledge.id, request_status_id: 1)

      respond_to do |format|

        if @knowledge_request.save

          # Comente a linha abaixo caso esteja usando rede WiFi da UnB (UNB Wireless ou eduroam)
          # KnowledgeRequestMailer.request_email(current_user, @knowledge_request).deliver_now
          # Envia uma mensagem pelo sistema interno de mensagens, informando ao administrador que foi solicitado um novo conhecimento
          current_user.send_message(User.find(7), "Requisitei o conhecimento: " + @knowledge_request.knowledge.description + " (" + @knowledge_request.knowledge.knowledge_level.level + "). Aprove ou recuse acessando Requisições de Conhecimento da sua home.", "[CONHECIMENTO] Requisição")
          
          # Cria-se um histórico da requisição
          @request_history = RequestHistory.new(knowledge_request_id: @knowledge_request.id, observation:'Conhecimento Requisitado.', request_status_id: 1)
          @request_history.save

          format.html { redirect_to knowledges_url, notice: 'A solicitação foi feita ao administrador.' }
          format.json { render :show, status: :created, location: @knowledge }

        else
          format.html { render :new }
          format.json { render json: @knowledge.errors, status: :unprocessable_entity }

        end

      end

    end

  end

  private

    def set_knowledge
      @knowledge = Knowledge.find(params[:id])
    end

    def knowledge_params
      params.require(:knowledge).permit(:knowledge_level_id, :description, :technology_id)
    end

end
