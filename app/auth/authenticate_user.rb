class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user: { id: @user.id, name: @user.first_name}) if user
  end

  private

  attr_accessor :email, :password, :user

  def user
    @user = User.find_by_email(email)
    return @user if @user && @user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
