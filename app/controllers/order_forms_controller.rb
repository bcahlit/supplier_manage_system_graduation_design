class OrderFormsController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    if params[:phone] != ''
      @customer = Customer.find_by phone: params[:phone]
      @orders = @customer.order_forms.page(params[:current] || 1).per(params[:size] || 10).order(time: :asc)
    else
      @orders = OrderForm.page(params[:current] || 1).per(params[:size] || 10).order(time: :asc)
    end
    render json: @orders, meta: pagination_dict(@orders)
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
    def make_meta(message, code)
      {
        code: code,
        message: message
      }
    end
    # Only allow a trusted parameter "white list" through.
    def order_params
      params.fetch(:order, {})
    end
end