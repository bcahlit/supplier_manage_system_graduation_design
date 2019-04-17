class AuthenticateUser
  def initialize(username, password)
    @user_name = username
    @password = password
  end

  # Service entry point
  def call
    [JsonWebToken.encode(user_id: user.id), user.id] if user
  end

  private

  attr_reader :user_name, :password

  # verify user credentials
  def user
    user = User.find_by(user_name: user_name)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end