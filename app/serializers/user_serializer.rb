class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :qq, :wechat, :real_name, :title, :password, :phone, :level, :sex, :password_confirmation
end
