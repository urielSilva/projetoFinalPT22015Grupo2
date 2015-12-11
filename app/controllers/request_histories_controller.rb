class RequestHistoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_request_history, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = RequestHistory.joins(:knowledge_request).ransack(params[:q])
    @request_histories = @search.result(distinct: true).includes(:knowledge_request).paginate(page: params[:page], per_page: 7)
  end

  def show
    unless @request_history.knowledge_request.user == current_user or !current_user.member?
      redirect_to request_histories_path, alert: 'Acesso negado.'
    end
  end

  def new
    @request_history = RequestHistory.new
  end

  def edit
  end

  def create
    @request_history = RequestHistory.new(request_history_params)

    respond_to do |format|
      if @request_history.save
        format.html { redirect_to @request_history, notice: 'Request history was successfully created.' }
        format.json { render :show, status: :created, location: @request_history }
      else
        format.html { render :new }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request_history.update(request_history_params)
        format.html { redirect_to @request_history, notice: 'Request history was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_history }
      else
        format.html { render :edit }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request_history.destroy
    respond_to do |format|
      format.html { redirect_to request_histories_url, notice: 'Request history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_request_history
      @request_history = RequestHistory.find(params[:id])
    end

    def request_history_params
      params.require(:request_history).permit(:knowledge_request_id, :observation)
    end

end
