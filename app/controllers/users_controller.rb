class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true).includes(:profile, :user_status).paginate(page: params[:page], per_page: 7)
  end

  def show
    @projects = @user.projects
    @projects_users = ProjectsUser.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def edit
    unless @user == current_user or current_user.admin? or (@user.member? and current_user.mod?)
      redirect_to users_path, :alert => "Acesso negado."
    end
  end

  def create
    @user = User.new(user_params)

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.save

        # verificar isso
        if @user.profile_id == nil
          @user.update(profile_id: 1)
        end

        format.html { redirect_to users_path, notice: 'O usuário foi criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update

    # isso aqui permite que o usuário edite as informações sem precisar atualizar a senha
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update_attributes(params[:user].permit(:name, :last_name, :user_status_id, :profile_id, :job_id, :sector_id, :area_id, :email, :password, :password_confirmation))
        format.html { redirect_to (users_path), notice: 'O usuário foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'O usuário foi excluído com sucesso.' }
        format.json { head :no_content }
      end
    else
      redirect_to users_path, :alert => "Acesso negado."
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :user_status_id, :profile_id, :job_id, :sector_id, :area_id, :email, :password, :password_confirmation)
    end

end