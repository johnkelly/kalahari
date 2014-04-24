class CheckIngredients
  include Interactor

  def perform
    meal = Meal.find(meal_id)

    unless user_has_neccessary_ingredients?(user, meal)
      fail!(errors: ["You are missing the ingredients required for this meal."])
    end
  end

  def setup
    context[:user] ||= nil
    context[:meal_id] ||= nil
  end

  private

  def user_has_neccessary_ingredients?(user, meal)
    user_food = user.ingredients.includes(:food).map(&:food)
    meal_food = meal.ingredients.includes(:food).map(&:food)

    (meal_food - user_food).empty?
  end
end
