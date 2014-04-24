class CancelUsersMeal
  include Interactor::Organizer

  organize ReturnIngredients, DeleteUsersMeal
end

