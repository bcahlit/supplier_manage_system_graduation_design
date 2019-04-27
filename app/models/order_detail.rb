class OrderDetail < ApplicationRecord
  belongs_to :order_form
  belongs_to :product
end
