class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :type,  :remark, :color, :classify
end
