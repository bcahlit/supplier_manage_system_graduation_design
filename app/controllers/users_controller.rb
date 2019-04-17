class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.user_name, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def me
    json_response current_user.as_json(only: [:user_name, :qq, :wechat, :real_name,
                                              :title, :phone, :level, :sex,])
  end


  private

  def user_params
    params.permit(
      :user_name,
      :qq,
      :wechat,
      :real_name,
      :title,
      :password,
      :phone,
      :level,
      :sex,
      :password_confirmation
    )
  end
end
