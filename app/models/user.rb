class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :schedule
  validates_presence_of :user_name, :phone, :password_digest
end
