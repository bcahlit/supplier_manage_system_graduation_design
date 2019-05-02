class SupplerProductsController < ApplicationController
  before_action :set_suppler_product, only: [:show, :update, :destroy]

  # GET /suppler_products
  def index
    @suppler_products = SupplerProduct.page(params[:current] || 1).per(params[:size] || 10)

    render json: @suppler_products, meta: pagination_dict(@suppler_products)
  end

  # GET /suppler_products/1
  def show
    render json: @suppler_product
  end

  # POST /suppler_products
  def create
    @suppler_product = SupplerProduct.new(suppler_product_params)

    if @suppler_product.save
      render json: @suppler_product, status: :created, location: @suppler_product
    else
      render json: @suppler_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /suppler_products/1
  def update
    if @suppler_product.update(suppler_product_params)
      render json: @suppler_product
    else
      render json: @suppler_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /suppler_products/1
  def destroy
    @suppler_product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suppler_product
      @suppler_product = SupplerProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def suppler_product_params
      params.permit(:name, :number, :type, :remark, :remark, :color, :size, :classify)
    end
end
