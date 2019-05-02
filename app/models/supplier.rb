class Supplier < ApplicationRecord
  paginates_per 10
  has_many :order_forms
  has_many :suppler_products
end
