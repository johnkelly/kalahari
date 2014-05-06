class UseIngredients
  include Interactor

  def perform
    meal_ingredients = users_meal.meal.ingredients.includes(:food, :measurement)
    user_ingredients = user.ingredients.includes(:food, :measurement)

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
    remaning_amount_in_mL = user_ingredient.mL - meal_ingredient.mL

    if remaning_amount_in_mL <= 0
      user_ingredient.destroy!
    else
      new_quantity = Measurement.convert_mL_to_measurement(remaning_amount_in_mL, user_ingredient.measurement.mL)
      user_ingredient.update!(quantity: new_quantity)
    end
  end
end
