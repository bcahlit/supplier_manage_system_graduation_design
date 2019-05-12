class User < ApplicationRecord
  rolify
  # resourcify
  has_secure_password
  has_many :notes
  has_many :schedule
  has_many :order_form
  validates_presence_of :user_name, :phone, :password_digest
end
