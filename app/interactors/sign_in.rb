class SignIn
  include Interactor::Organizer

  organize AuthenticateUser, IncrementSignInCount
end
