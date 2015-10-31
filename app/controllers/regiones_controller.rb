class RegionesController < ApplicationController
  before_action :set_region, only: [:show, :update, :destroy]

  # GET /regiones
  # GET /regiones.json
  def index
    @regiones = Region.all

    render json: @regiones
  end

  # GET /regiones/1
  # GET /regiones/1.json
  def show
    render json: @region
  end

  # POST /regiones
  # POST /regiones.json
  def create
    @region = Region.new(region_params)

    if @region.save
      render json: @region, status: :created, location: @region
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /regiones/1
  # PATCH/PUT /regiones/1.json
  def update
    @region = Region.find(params[:id])

    if @region.update(region_params)
      head :no_content
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # DELETE /regiones/1
  # DELETE /regiones/1.json
  def destroy
    @region.destroy

    head :no_content
  end

  private

    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:nombre)
    end
end
