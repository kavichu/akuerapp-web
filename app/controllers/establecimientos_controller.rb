class EstablecimientosController < ApplicationController
  before_action :set_establecimiento, only: [:show, :update, :destroy]

  # GET /establecimientos
  # GET /establecimientos.json
  def index
    if params[:location] != nil
      puts "LOCATION" + params[:location]
      @establecimientos = Establecimiento.findNearby
    else
      @establecimientos = Establecimiento.all
    end

    render json: @establecimientos
  end

  # GET /establecimientos/1
  # GET /establecimientos/1.json
  def show
    render json: @establecimiento
  end

  # POST /establecimientos
  # POST /establecimientos.json
  def create
    @establecimiento = Establecimiento.new(establecimiento_params)

    if @establecimiento.save
      render json: @establecimiento, status: :created, location: @establecimiento
    else
      render json: @establecimiento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /establecimientos/1
  # PATCH/PUT /establecimientos/1.json
  def update
    @establecimiento = Establecimiento.find(params[:id])

    if @establecimiento.update(establecimiento_params)
      head :no_content
    else
      render json: @establecimiento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /establecimientos/1
  # DELETE /establecimientos/1.json
  def destroy
    @establecimiento.destroy

    head :no_content
  end

  private

    def set_establecimiento
      @establecimiento = Establecimiento.find(params[:id])
    end

    def establecimiento_params
      params.require(:establecimiento).permit(:nombre, :tipo, :direccion, :telefono, :responsable, :depende_de, :estado, :latitud, :longitud, :codigo, :internet, :codigo_saa, :fecha_activo, :fecha_inactivo)
    end
end
