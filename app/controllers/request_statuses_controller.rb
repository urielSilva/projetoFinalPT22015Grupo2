class RequestStatusesController < ApplicationController 

  before_action :authenticate_user!
  before_action :set_request_status, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = RequestStatus.ransack(params[:q])
    @request_statuses = @search.result(distinct: true).paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @request_status = RequestStatus.new
  end

  def edit
  end

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

  def destroy
    @request_status.destroy
    respond_to do |format|
      format.html { redirect_to request_statuses_url, notice: 'Request status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_request_status
      @request_status = RequestStatus.find(params[:id])
    end

    def request_status_params
      params.require(:request_status).permit(:status)
    end
    
end
