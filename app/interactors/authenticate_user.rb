class AuthenticateUser
  include Interactor

  def perform
    user = User.where(email: email).first
    if user && user.authenticate(password)
      context[:user] = user
    else
      fail!(errors: ["Email or password is invalid"])
    end
  end

  def setup
    context[:email] ||= nil
    context[:password] ||= nil
  end
end
