class KnowledgesUsersController < ApplicationController
  before_action :set_knowledges_user, only: [:show, :edit, :update, :destroy]

  # GET /knowledges_users
  # GET /knowledges_users.json
  def index
    @knowledges_users = KnowledgesUser.all
  end

  # GET /knowledges_users/1
  # GET /knowledges_users/1.json
  def show
  end

  # GET /knowledges_users/new
  def new
    @knowledges_user = KnowledgesUser.new
  end

  # GET /knowledges_users/1/edit
  def edit
  end

  # POST /knowledges_users
  # POST /knowledges_users.json
  def create
    @knowledges_user = KnowledgesUser.new(knowledges_user_params)

    respond_to do |format|
      if @knowledges_user.save
        format.html { redirect_to @knowledges_user, notice: 'Knowledges user was successfully created.' }
        format.json { render :show, status: :created, location: @knowledges_user }
      else
        format.html { render :new }
        format.json { render json: @knowledges_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledges_users/1
  # PATCH/PUT /knowledges_users/1.json
  def update
    respond_to do |format|
      if @knowledges_user.update(knowledges_user_params)
        format.html { redirect_to @knowledges_user, notice: 'Knowledges user was successfully updated.' }
        format.json { render :show, status: :ok, location: @knowledges_user }
      else
        format.html { render :edit }
        format.json { render json: @knowledges_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledges_users/1
  # DELETE /knowledges_users/1.json
  def destroy
    @knowledges_user.destroy
    respond_to do |format|
      format.html { redirect_to knowledges_users_url, notice: 'Knowledges user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledges_user
      @knowledges_user = KnowledgesUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledges_user_params
      params.require(:knowledges_user).permit(:user_id, :knowledge_id)
    end
end
