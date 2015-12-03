class ActivitiesUsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_activities_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @activities_users = ActivitiesUser.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @activities_user = ActivitiesUser.new
  end

  def edit
  end

  def create
    @activities_user = ActivitiesUser.new(activities_user_params)

    respond_to do |format|
      if @activities_user.save
        format.html { redirect_to @activities_user, notice: 'A associação foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @activities_user }
      else
        format.html { render :new }
        format.json { render json: @activities_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activities_user.update(activities_user_params)
        format.html { redirect_to @activities_user, notice: 'A associação foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @activities_user }
      else
        format.html { render :edit }
        format.json { render json: @activities_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activities_user.destroy
    respond_to do |format|
      format.html { redirect_to activities_users_url, notice: 'A associação foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_activities_user
      @activities_user = ActivitiesUser.find(params[:id])
    end

    def activities_user_params
      params.require(:activities_user).permit(:user_id, :activity_id)
    end

end
