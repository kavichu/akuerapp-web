class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :update, :destroy]

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.paginate(:page => params[:page], :per_page => 25)
    # render json: ProductoSerializer.new(@productos)
    
    # respond_with @productos, serializer: PaginationSerializer
    render json: @productos
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    render json: @producto
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    if @producto.save
      render json: @producto, status: :created, location: @producto
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    @producto = Producto.find(params[:id])

    if @producto.update(producto_params)
      head :no_content
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto.destroy

    head :no_content
  end

  private

    def set_producto
      @producto = Producto.find(params[:id])
    end

    def producto_params
      params.require(:producto).permit(:nombre, :tipo, :codigo_dncp, :estado, :codigo, :mapa, :clasificador, :subclasificador, :concentracion, :forma_parmaceutica, :presentacion, :codigo_grupo_farmacologico, :nombre_grupo_farmacologico, :codigo_subgrupo_farmacologico, :nombre_subgrupo_farmacologico, :tipo_adquisicion)
    end
end
