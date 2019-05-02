class OrderForm < ApplicationRecord
  belongs_to :operator, class_name: "user", foreign_key: "user_id"
end
