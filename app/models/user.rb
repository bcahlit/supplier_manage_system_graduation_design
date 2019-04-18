class User < ApplicationRecord
  has_secure_password
  has_many :notes
  validates_presence_of :user_name, :phone, :password_digest
end
