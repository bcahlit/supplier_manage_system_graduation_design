class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :total, :number, :introduction, :type, :time, :remake, :price, :color, :size, :band, :classify
end
