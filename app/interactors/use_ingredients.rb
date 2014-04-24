class UseIngredients
  include Interactor

  def perform
    meal_ingredients = users_meal.meal.ingredients
    user_ingredients = user.ingredients

    meal_ingredients.each do |meal_ingredient|
      user_ingredient = user_ingredients.detect{|ui| ui.food_id == meal_ingredient.food_id }
      reduce_quantity_or_remove_ingredient(user_ingredient, meal_ingredient)
    end
  end

  def setup
    context[:user] ||= nil
    context[:users_meal] ||= nil
  end

  private

  def reduce_quantity_or_remove_ingredient(user_ingredient, meal_ingredient)
    user_ingredient.decrement(:quantity, meal_ingredient.quantity)

    if user_ingredient.quantity <= 0
      user_ingredient.destroy!
    else
      user_ingredient.save!
    end
  end
end
