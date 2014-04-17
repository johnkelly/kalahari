class AddUser
  include Interactor

  def perform
    @user = User.new(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, auth_token: User.generate_authentication_token)

    if @user.save
      context[:user] = @user
    else
      errors = @user.errors.full_messages
      fail!(errors: errors)
    end
  end

  def setup
    context[:email] ||= nil
    context[:password] ||= nil
    context[:password_confirmation] ||= nil
    context[:first_name] ||= nil
  end
end
