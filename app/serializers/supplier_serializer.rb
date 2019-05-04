class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :type, :address, :level, :email, :state, :concat, :zip, :bank_number, :reputation, :fax, :remark, :timely, :aftersales, :componiship
end
