class EstablecimientoProductosController < ApplicationController
  before_action :set_establecimiento_producto, only: [:show, :update, :destroy]

  # GET /establecimiento_productos
  # GET /establecimiento_productos.json
  def index
    @establecimiento_productos = EstablecimientoProducto.all

    render json: @establecimiento_productos
  end

  # GET /establecimiento_productos/1
  # GET /establecimiento_productos/1.json
  def show
    render json: @establecimiento_producto
  end

  # POST /establecimiento_productos
  # POST /establecimiento_productos.json
  def create
    @establecimiento_producto = EstablecimientoProducto.new(establecimiento_producto_params)

    if @establecimiento_producto.save
      render json: @establecimiento_producto, status: :created, location: @establecimiento_producto
    else
      render json: @establecimiento_producto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /establecimiento_productos/1
  # PATCH/PUT /establecimiento_productos/1.json
  def update
    @establecimiento_producto = EstablecimientoProducto.find(params[:id])

    if @establecimiento_producto.update(establecimiento_producto_params)
      head :no_content
    else
      render json: @establecimiento_producto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /establecimiento_productos/1
  # DELETE /establecimiento_productos/1.json
  def destroy
    @establecimiento_producto.destroy

    head :no_content
  end

  private

    def set_establecimiento_producto
      @establecimiento_producto = EstablecimientoProducto.find(params[:id])
    end

    def establecimiento_producto_params
      params.require(:establecimiento_producto).permit(:producto, :establecimiento, :disponible, :fecha, :periodicidad, :tipo_ingreso, :fecha_ultimo_movimiento, :fecha_distribucion)
    end
end
