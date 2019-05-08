class OrderForm < ApplicationRecord
  belongs_to :user
  # belongs_to :supplier
  belongs_to :product
  # belongs_to :reviewer, class_name: "user", foreign_key: "user_id"
end
