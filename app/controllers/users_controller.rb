class UsersController < ApplicationController
  # wrap_parameters
  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: [:show, :update, :destroy]
  # POST /signup
  # return authenticated token upon signup

  def index
    # todo: 如果有排序 增加排序功能 还有按其他方式选择
    if params[:selectValue]
      value = params[:selectValue]
      type = params[:selectType]
      @users = User.where("#{type} LIKE ?", '%'+value+'%').page(params[:current] || 1).per(params[:size] || 10)
    else
      @users = User.page(params[:current] || 1).per(params[:size] || 10)
    end
    render json: @users, each_serializer: UserSerializer , meta: pagination_dict(@users)
  end

  # GET /users/1
  def show
    render json: @user
  end

  def create
    role = user_params[:role]
    user_params_create = user_params.delete(:role)
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.user_name, user.password).call
    user.add_role role
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      if(@user.roles[0]) then
        @user.remove_role @user.roles[0].name
      end
      @user.add_role params[:role]
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def me
    json_response current_user
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :id,
        :user_name,
        :qq,
        :wechat,
        :real_name,
        :title,
        :password,
        :phone,
        :level,
        :sex,
        :role,
        :password_confirmation
      )
    end
end
