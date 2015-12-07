class KnowledgeRequestsController < ApplicationController
  before_action :set_knowledge_request, only: [:show, :edit, :update, :destroy]

  # GET /knowledge_requests
  # GET /knowledge_requests.json
  def index
    @knowledge_requests = KnowledgeRequest.all
  end

  # GET /knowledge_requests/1
  # GET /knowledge_requests/1.json
  def show
  end

  # GET /knowledge_requests/new
  def new
    @knowledge_request = KnowledgeRequest.new
  end

  # GET /knowledge_requests/1/edit
  def edit
  end

  # POST /knowledge_requests
  # POST /knowledge_requests.json
  def create
    @knowledge_request = KnowledgeRequest.new(knowledge_request_params)

    respond_to do |format|
      if @knowledge_request.save
        format.html { redirect_to @knowledge_request, notice: 'Knowledge request was successfully created.' }
        format.json { render :show, status: :created, location: @knowledge_request }
      else
        format.html { render :new }
        format.json { render json: @knowledge_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledge_requests/1
  # PATCH/PUT /knowledge_requests/1.json
  def update
    respond_to do |format|
      if @knowledge_request.update(knowledge_request_params)
        format.html { redirect_to @knowledge_request, notice: 'Knowledge request was successfully updated.' }
        format.json { render :show, status: :ok, location: @knowledge_request }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_requests/1
  # DELETE /knowledge_requests/1.json
  def destroy
    @knowledge_request.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_requests_url, notice: 'Knowledge request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge_request
      @knowledge_request = KnowledgeRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledge_request_params
      params.require(:knowledge_request).permit(:knowledge_id, :user_id)
    end
end
