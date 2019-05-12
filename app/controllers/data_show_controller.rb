class DataShowController < ApplicationController

  def get_number_by_supplier
    suppliers = OrderForm.all.group_by{ |u| u.supplier_id }
    @supplier_number = []
    suppliers.each do |key, value|
      if key != nil
        @supplier_number.push({
          supplier: Supplier.find(key).name,
          number: value.count
        })
      end
    end
    render json: @supplier_number
  end

  def get_order_number_by_time
    # @user.comments.group("DATE_TRUNC('month', created_at)").count pssql
    orderforms = OrderForm.all.group_by{ |u| u.created_at.beginning_of_month }
    order_number = []
    orderforms.each do |key, value|
      if key != nil
        order_number.push({
          time: key,
          number: value.count
        })
      end
    end
    render json: order_number
  end

  # OrderForm.all.group("year(created_at)").group("month(created_at)").count

  # OrderForm.all.group_by{ |u| u.created_at.beginning_of_month }
end