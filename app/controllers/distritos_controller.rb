class DistritosController < ApplicationController
  before_action :set_distrito, only: [:show, :update, :destroy]

  # GET /distritos
  # GET /distritos.json
  def index
    @distritos = Distrito.all

    render json: @distritos
  end

  # GET /distritos/1
  # GET /distritos/1.json
  def show
    render json: @distrito
  end

  # POST /distritos
  # POST /distritos.json
  def create
    @distrito = Distrito.new(distrito_params)

    if @distrito.save
      render json: @distrito, status: :created, location: @distrito
    else
      render json: @distrito.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /distritos/1
  # PATCH/PUT /distritos/1.json
  def update
    @distrito = Distrito.find(params[:id])

    if @distrito.update(distrito_params)
      head :no_content
    else
      render json: @distrito.errors, status: :unprocessable_entity
    end
  end

  # DELETE /distritos/1
  # DELETE /distritos/1.json
  def destroy
    @distrito.destroy

    head :no_content
  end

  private

    def set_distrito
      @distrito = Distrito.find(params[:id])
    end

    def distrito_params
      params.require(:distrito).permit(:region, :nombre)
    end
end
