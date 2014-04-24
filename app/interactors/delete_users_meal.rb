class DeleteUsersMeal
  include Interactor

  def perform
    users_meal.destroy!
  end

  def setup
    context[:users_meal] ||= nil
  end
end
