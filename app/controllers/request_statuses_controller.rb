class RequestStatusesController < ApplicationController
  before_action :set_request_status, only: [:show, :edit, :update, :destroy]

  # GET /request_statuses
  # GET /request_statuses.json
  def index
    @request_statuses = RequestStatus.all
  end

  # GET /request_statuses/1
  # GET /request_statuses/1.json
  def show
  end

  # GET /request_statuses/new
  def new
    @request_status = RequestStatus.new
  end

  # GET /request_statuses/1/edit
  def edit
  end

  # POST /request_statuses
  # POST /request_statuses.json
  def create
    @request_status = RequestStatus.new(request_status_params)

    respond_to do |format|
      if @request_status.save
        format.html { redirect_to @request_status, notice: 'Request status was successfully created.' }
        format.json { render :show, status: :created, location: @request_status }
      else
        format.html { render :new }
        format.json { render json: @request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_statuses/1
  # PATCH/PUT /request_statuses/1.json
  def update
    respond_to do |format|
      if @request_status.update(request_status_params)
        format.html { redirect_to @request_status, notice: 'Request status was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_status }
      else
        format.html { render :edit }
        format.json { render json: @request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_statuses/1
  # DELETE /request_statuses/1.json
  def destroy
    @request_status.destroy
    respond_to do |format|
      format.html { redirect_to request_statuses_url, notice: 'Request status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_status
      @request_status = RequestStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_status_params
      params.require(:request_status).permit(:status)
    end
end
