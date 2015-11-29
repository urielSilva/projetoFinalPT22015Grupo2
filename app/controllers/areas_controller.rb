class AreasController < ApplicationController

  before_action :authenticate_user!
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]
  
  def index
      @areas = Area.all.paginate(page: params[:page], per_page: 10)
  end
  
  def show
  end
  
  def new
      @area = Area.new
  end
  
  def edit
  end
  
  def create
      @area = Area.new(area_params)
      
      respond_to do |format|
          if @area.save
              format.html { redirect_to @area, notice: 'A área foi criada com sucesso.'}
              format.json { render  :show, status: :ok, location: @area }
          else
              format.html { render :edit }
              format.json { render json: @area.errors, status: :unprocessable_entity }
          end
      end
  end
  
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'A área foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
        format.html { redirect_to areas_url, notice: 'A área foi excluída com sucesso.'}
        format.json { head :no_content }
      end
  end
  
  private
  
    def set_area
      @area = Area.find(params[:id])
    end
    
    def area_params
      params.require(:area).permit(:name, :sector_id)
    end

end
