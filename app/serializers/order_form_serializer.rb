class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :customer, :time, :remark, :total_price, :score, :state
  has_many :order_details
end
