class Point < ApplicationRecord
  belongs_to :customer
  belongs_to :order_form
end
