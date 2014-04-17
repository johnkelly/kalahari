class IncrementSignInCount
  include Interactor

  def perform
    user.increment!(:sign_in_count)
    context[:user] = user
  end

  def setup
    context[:user] ||= nil
  end
end
