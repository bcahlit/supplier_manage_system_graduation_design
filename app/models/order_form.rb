class OrderForm < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :points, dependent: :destroy
end
