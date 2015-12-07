class ProjectStatusesController < ApplicationController
	
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @search = ProjectStatus.ransack(params[:q])
    @project_statuses = @search.result(distinct: true).all.paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @project_status = ProjectStatus.new
  end

  def edit
  end

  def create
    @project_status = ProjectStatus.new(project_status_params)

    respond_to do |format|
      if @project_status.save
        format.html { redirect_to @project_status, notice: 'project status was successfully created.' }
        format.json { render :show, status: :created, location: @projectstatus }
      else
        format.html { render :new }
        format.json { render json: @project_status.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @project_status.update(project_status_params)
        format.html { redirect_to @project_status, notice: 'project status was successfully updated.' }
        format.json { render :show, status: :ok, location: @projectstatus }
      else
        format.html { render :edit }
        format.json { render json: @projectstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_status.destroy
    respond_to do |format|
      format.html { redirect_to project_status_url, notice: 'project status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project_status = ProjectStatus.find(params[:id])
    end

    def project_status_params
      params.require(:project_status).permit(:status)
    end
    
end
