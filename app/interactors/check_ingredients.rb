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
    has_ingredients = true

    user_ingredients = user.ingredients.includes(:food)
    meal_ingredients = meal.ingredients.includes(:food)

    meal_ingredients.each do |meal_ingredient|
      user_ingredient = find_ingredient(user_ingredients, meal_ingredient)
      has_ingredients = false unless user_ingredient.present?
    end

    has_ingredients
  end

  def find_ingredient(user_ingredients, meal_ingredient)
    user_ingredients.detect do |user_ingredient|
      has_ingredient_and_has_enough?(user_ingredient, meal_ingredient)
    end
  end

  def has_ingredient_and_has_enough?(user_ingredient, meal_ingredient)
    if user_ingredient.food_id == meal_ingredient.food_id
    Rails.logger.info meal_ingredient.mL
    Rails.logger.info user_ingredient.mL
    end

    user_ingredient.food_id == meal_ingredient.food_id && user_ingredient.mL >= meal_ingredient.mL
  end
end
