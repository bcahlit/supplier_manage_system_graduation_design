class Customer < ApplicationRecord
  paginates_per 10
  has_many :order_forms
  has_many :points
end
