class UserStatusesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_status, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @user_statuses = UserStatus.all.order(:id).paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @user_status = UserStatus.new
  end

  def edit
  end

  def create
    @user_status = UserStatus.new(user_status_params)

    respond_to do |format|
      if @user_status.save
        format.html { redirect_to @user_status, notice: 'O status de usuário foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @user_status }
      else
        format.html { render :new }
        format.json { render json: @user_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_status.update(user_status_params)
        format.html { redirect_to @user_status, notice: 'O status de usuário foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user_status }
      else
        format.html { render :edit }
        format.json { render json: @user_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_status.destroy
    respond_to do |format|
      format.html { redirect_to user_statuses_url, notice: 'O status de usuário foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user_status
      @user_status = UserStatus.find(params[:id])
    end

    def user_status_params
      params.require(:user_status).permit(:status)
    end
    
end
