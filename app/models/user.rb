class User < ApplicationRecord
  has_secure_password
  #todo hasmany notes
  validates_presence_of :user_name, :phone, :password_digest
end
