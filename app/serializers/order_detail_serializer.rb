class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :number, :time, :price, :origin_price, :product, :state
  has_one :product, serializer: ProductSimplifySerializer
end
