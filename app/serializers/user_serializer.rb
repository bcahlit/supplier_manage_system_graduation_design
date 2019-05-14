class UserSerializer < ActiveModel::Serializer
  attributes :id, :role, :user_name, :qq, :wechat, :real_name, :title, :password, :phone, :level, :sex, :password_confirmation

  def role
    object.roles[0] ? object.roles[0].name : nil
  end
  
end
