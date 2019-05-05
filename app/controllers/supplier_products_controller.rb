class SupplierProductsController < ApplicationController
  before_action :set_supplier_product, only: [:show, :update, :destroy]

  # GET /supplier_products
  def index
    if params[:supplier]
      @supplier_products = Supplier.find(params[:supplier_id]).supplier_products.page(params[:current] || 1).per(params[:size] || 10)
    elsif params[:supplier_name]
      @supplier_products = Supplier.find_by(name: params[:supplier_name]).supplier_products.page(params[:current] || 1).per(params[:size] || 10)
    else
      @supplier_products = SupplierProduct.page(params[:current] || 1).per(params[:size] || 10)
    end

    render json: @supplier_products, meta: pagination_dict(@supplier_products)
  end

  # GET /supplier_products/1
  def show
    render json: @supplier_product
  end

  # POST /supplier_products
  def create
    # SupplierProduct.new(supplier_id: 0, product_id: 2, price: 5, other: "wet")
    @supplier_product = SupplierProduct.new(supplier_product_params)

    if @supplier_product.save
      render json: @supplier_product, status: :created, location: @supplier_product
    else
      render json: @supplier_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /supplier_products/1
  def update
    if @supplier_product.update(supplier_product_params)
      render json: @supplier_product
    else
      render json: @supplier_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /supplier_products/1
  def destroy
    @supplier_product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_product
      @supplier_product = SupplierProduct.find(params[:id])
    end

    def delete_useless_att
      supplier_product_params.delete(supplier_name)
    end
    
    # Only allow a trusted parameter "white list" through.
    def supplier_product_params
      params.permit(:product_id, :supplier_id, :supplier_name, :price, :back_rate, :standard)
    end
end
