class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :supplier_prodect, :comment, :product_id, :reviewer_id, :user_id, :time, :number, :remark, :total_price, :priority, :state
  attribute :supplier
  # belongs_to :supplier, serializer: SupplierSimplifySerializer
  belongs_to :product, serializer: ProductSimplifySerializer

  def comment
    Comment.find_by(order_form_id: object.id)
  end

  def supplier
    if object.supplier_id
      _supplier = Supplier.find(object.supplier_id)
      {id: _supplier.id, name: _supplier.name}
    else
      nil
    end
  end

  def supplier_prodect
    if object.supplier_id
      prodect = SupplierProduct.where(supplier_id: object.supplier_id).where(product_id: object.product_id)
      prodect[0] ? prodect[0].id : nil
    else
      nil
    end
  end

end
