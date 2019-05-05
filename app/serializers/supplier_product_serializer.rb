class SupplierProductSerializer < ActiveModel::Serializer
  attributes :id, :product, :commit, :price, :back_rate, :standard
  belongs_to :product, serializer: ProductSimplifySerializer
end
