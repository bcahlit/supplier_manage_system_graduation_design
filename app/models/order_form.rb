class OrderForm < ApplicationRecord
  belongs_to :supplier
  has_many :order_details, dependent: :destroy
  has_many :points, dependent: :destroy
end
