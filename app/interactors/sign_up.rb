class SignUp
  include Interactor::Organizer

  organize AddUser, IncrementSignInCount
end
