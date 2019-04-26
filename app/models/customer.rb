class Customer < ApplicationRecord
  paginates_per 10
  has_many :orders
  has_many :points
end
