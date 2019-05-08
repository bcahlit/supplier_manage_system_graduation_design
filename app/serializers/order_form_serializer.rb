class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :reviewer_id, :user_id, :time, :number, :remark, :total_price, :priority, :state
  # belongs_to :supplier, serializer: SupplierSimplifySerializer
  belongs_to :product, serializer: ProductSimplifySerializer
end
