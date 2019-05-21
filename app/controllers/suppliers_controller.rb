class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :update, :destroy]

  # GET /suppliers
  def index
    # todo: 如果有排序 增加排序功能 还有按其他方式选择
    if params[:selectType] == "product"
      product_id = Product.select('id').where("name LIKE ?", '%'+params[:selectValue]+'%')
      supplier_ids = SupplierProduct.select('supplier_id').distinct.where(product_id: product_id)
      # logger.debug supplier_ids
      @suppliers = Supplier.where(id: supplier_ids).page(params[:current] || 1).per(params[:size] || 10)
    elsif params[:selectValue]
      value = params[:selectValue]
      type = params[:selectType]
      @suppliers = Supplier.where("#{type} LIKE ?", '%'+value+'%').page(params[:current] || 1).per(params[:size] || 10)
    else
      @suppliers = Supplier.page(params[:current] || 1).per(params[:size] || 10)
    end
    render json: @suppliers, each_serializer: SupplierSerializer , meta: pagination_dict(@suppliers)
  end

  # GET /suppliers/1
  def show
    render json: @supplier
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      render json: @supplier, status: :created, location: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      render json: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.permit(:phone, :name, :type, :address, :level, :email,
        :state, :concat, :zip, :address, :bank_number, :reputation, :fax,
        :remark, :timely, :aftersales, :componiship)
    end
end
