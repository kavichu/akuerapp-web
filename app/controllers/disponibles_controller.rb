class DisponiblesController < ApplicationController
  before_action :set_disponible, only: [:show, :update, :destroy]

  # GET /disponibles
  # GET /disponibles.json
  def index
    @disponibles = Disponible.all

    render json: @disponibles
  end

  # GET /disponibles/1
  # GET /disponibles/1.json
  def show
    render json: @disponible
  end

  # POST /disponibles
  # POST /disponibles.json
  def create
    @disponible = Disponible.new(disponible_params)

    if @disponible.save
      render json: @disponible, status: :created, location: @disponible
    else
      render json: @disponible.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /disponibles/1
  # PATCH/PUT /disponibles/1.json
  def update
    @disponible = Disponible.find(params[:id])

    if @disponible.update(disponible_params)
      head :no_content
    else
      render json: @disponible.errors, status: :unprocessable_entity
    end
  end

  # DELETE /disponibles/1
  # DELETE /disponibles/1.json
  def destroy
    @disponible.destroy

    head :no_content
  end

  private

    def set_disponible
      @disponible = Disponible.find(params[:id])
    end

    def disponible_params
      params.require(:disponible).permit(:disponible, :fecha, :periodicidad, :tipo_ingreso, :fecha_ultimo_movimiento, :fecha_distribucion)
    end
end
