class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :customer, :time, :remark, :total_price, :score, :state
  has_many :order_details, serializer: OrderDetailSerializer
  belongs_to :customer, serializer: CustomerSimplifySerializer
end
