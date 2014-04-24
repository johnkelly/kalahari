class CreateUsersMeal
  include Interactor::Organizer

  organize CheckIngredients, AddUsersMeal, UseIngredients
end
