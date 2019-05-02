class OrderFormSerializer < ActiveModel::Serializer
  attributes :id, :product, :reviewer, :supplier, :user, :time, :number, :remark, :total_price, :priority, :state
  belongs_to :supplier, serializer: SupplierSimplifySerializer
end
