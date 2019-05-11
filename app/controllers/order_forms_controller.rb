class OrderFormsController < ApplicationController
  before_action :set_order_form, only: [:show, :update, :destroy]

  # GET /order_forms
  def index
    # TODO 进行一些排序以及筛选
    if params[:user_id]
      @order_forms = OrderForm.where(user_id: params[:user_id])
        .where(state: params[:state].split(",")).order(time: :asc).page(params[:current] || 1).per(params[:size] || 10)
    else
      @order_forms = OrderForm.where(state: params[:state].split(",")).order(time: :asc).page(params[:current] || 1).per(params[:size] || 10)
    end

    render json: @order_forms,
           each_serializer: OrderFormSerializer,
           meta: pagination_dict(@order_forms)
  end

  # GET /order_forms/1
  def show
    render json: @order_form
  end

  # POST /order_forms
  def create
    @order_form = current_user.order_form.build(order_form_params)

    if @order_form.save
      render json: @order_form, serializer: OrderFormSerializer, status: :created, location: @order_form
    else
      render json: @order_form.errors, serializer: OrderFormSerializer, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_forms/1
  def update
    if @order_form.update(order_form_params)
      render json: @order_form
    else
      render json: @order_form.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_forms/1
  def destroy
    @order_form.destroy
  end

  def product_supplier
    supplier_ids = SupplierProduct.select('supplier_id').distinct.where(product_id: params[:product_id])
    # logger.debug supplier_ids
    suppliers = Supplier.where(id: supplier_ids).page(params[:current] || 1).per(params[:size] || 10)

    render json: suppliers, each_serializer: SupplierSimplifySerializer
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_form
      @order_form = OrderForm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_form_params
      params.require(:order_form).permit(:supplier_id, :total_price, :user_id , :product_id, :reviewer_id, :time, :number, :remark, :priority, :state)
      # params.fetch(:order_form, {})
    end
end
