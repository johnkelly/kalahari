class AddUsersMeal
  include Interactor

  def perform
    users_meal = user.users_meals.new({ meal_id: meal_id, scheduled_at: scheduled_at })

    if users_meal.save
      context[:users_meal] = users_meal
    else
      errors = users_meal.errors.full_messages
      fail!(errors: errors)
    end
  end

  def setup
    context[:user] ||= nil
    context[:meal_id] ||= nil
    context[:scheduled_at] ||= nil
  end
end
