class ProjectStatusesController < ApplicationController
		before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @projectstatuses = ProjectStatus.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @project_status = ProjectStatus.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @projectstatus = ProjectStatus.new(project_status_params)

    respond_to do |format|
      if @projectstatus.save
        format.html { redirect_to @projectstatus, notice: 'project status was successfully created.' }
        format.json { render :show, status: :created, location: @projectstatus }
      else
        format.html { render :new }
        format.json { render json: @projectstatus.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @projectstatus.update(project_status_params)
        format.html { redirect_to @project_status, notice: 'project status was successfully updated.' }
        format.json { render :show, status: :ok, location: @projectstatus }
      else
        format.html { render :edit }
        format.json { render json: @projectstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @projectstatus.destroy
    respond_to do |format|
      format.html { redirect_to project_status_url, notice: 'project status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @projectstatus = ProjectStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_status_params
      params.require(:project_status).permit(:status)
    end
end
