class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :type,  :remake, :color, :size, :classify
end
