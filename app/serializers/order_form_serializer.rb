class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :comment, :product_id, :reviewer_id, :user_id, :time, :number, :remark, :total_price, :priority, :state
  attribute :supplier
  # belongs_to :supplier, serializer: SupplierSimplifySerializer
  belongs_to :product, serializer: ProductSimplifySerializer

  def comment
    Comment.find_by(order_form_id: :id)
  end

  def supplier
    supplier = Supplier.find(object.supplier_id)
    if supplier
      {id: supplier.id, name: supplier.name}
    else
      nil
    end
  end
end
