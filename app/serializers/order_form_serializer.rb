class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :supplier, :time, :remark, :total_price, :score, :state
  has_many :order_details, serializer: OrderDetailSerializer
  belongs_to :supplier, serializer: SupplierSimplifySerializer
end
