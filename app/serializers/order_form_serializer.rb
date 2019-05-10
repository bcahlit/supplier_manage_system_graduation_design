class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :comment, :product_id, :reviewer_id, :user_id, :time, :number, :remark, :total_price, :priority, :state
  attribute :supplier, serializer: SupplierSimplifySerializer
  # belongs_to :supplier, serializer: SupplierSimplifySerializer
  belongs_to :product, serializer: ProductSimplifySerializer

  def comment
    Comment.find_by(order_form_id: :id)
  end

  def supplier
    Supplier.find(object.supplier_id)
  end
end
