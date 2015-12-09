class ActivitiesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :index, only: [:associar]
  load_and_authorize_resource except: [:create]

  def index
    @search = Activity.ransack(params[:q])
    @activities = @search.result(distinct: true).includes(:activity_type).paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'A atividade foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def associar
    @activities_user = ActivitiesUser.new(user_id: current_user.id, activity_id: @activity.id)

    respond_to do |format|
      if @activities_user.save
        format.html { redirect_to activities_url, notice: 'A atividade foi associada com sucesso.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'A atividade foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'A atividade foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:description, :credit_numbers, :activity_type_id)
    end

end
