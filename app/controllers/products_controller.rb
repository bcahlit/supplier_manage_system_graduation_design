class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    # todo 更改查询逻辑
    # if params[:name]
    #   @products = Product.where("name LIKE ?", params[:name]+'%').page(params[:current] || 1).per(params[:size] || 10)
    #   @total = Product.where("name LIKE ?", params[:name]+'%').count
    # elsif params[:number]
    #   @total = Product.where("number LIKE ?", params[:number]+'%').count
    #   @products = Product.where("number LIKE ?", params[:number]+'%').page(params[:current] || 1).per(params[:size] || 10)
    # elsif params[:size]
    #   @total = Product.where("size LIKE ?", params[:size]+'%').count
    #   @products = Product.where("size LIKE ?", params[:size]+'%').page(params[:current] || 1).per(params[:size] || 10)
    # elsif params[:band]
    #   @total = Product.where("band LIKE ?", params[:band]+'%').count
    #   @products = Product.where("band LIKE ?", params[:band]+'%').page(params[:current] || 1).per(params[:size] || 10)
    # elsif params[:classify]
    #   @total = Product.where("classify LIKE ?", params[:classify]+'%').count
    #   @products = Product.where("classify LIKE ?", params[:classify]+'%').page(params[:current] || 1).per(params[:size] || 10)
    # elsif params[:introduction]
    #   @total = Product.where("introduction LIKE ?", params[:introduction]+'%').count
    #   @products = Product.where("introduction LIKE ?", params[:introduction]+'%').page(params[:current] || 1).per(params[:size] || 10)
    # end
    @products = Product.page(params[:current] || 1).per(params[:size] || 10)
    render json: {products: @products, currentPage: @products.current_page, pageSize: @products.count, total: @total}
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :number, :type, :remark, :color, :size, :classify)
    end
end
