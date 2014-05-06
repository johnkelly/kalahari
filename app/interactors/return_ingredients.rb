class ReturnIngredients
  include Interactor

  def perform
    meal_ingredients = users_meal.meal.ingredients
    user_ingredients = user.ingredients

    meal_ingredients.each do |meal_ingredient|
      user_ingredient = user_ingredients.detect{|ui| ui.food_id == meal_ingredient.food_id }
      increase_quantity_or_create_ingredient(user_ingredient, meal_ingredient)
    end
  end

  def setup
    context[:user] ||= nil
    context[:users_meal] ||= nil
  end

  private

  def increase_quantity_or_create_ingredient(user_ingredient, meal_ingredient)
    if user_ingredient.present?
      new_amount = Measurement.convert_mL_to_measurement(meal_ingredient.mL, user_ingredient.measurement.mL)
      user_ingredient.increment!(:quantity, new_amount)
    else
      user.ingredients.create!(food_id: meal_ingredient.food_id,
                               measurement_id: meal_ingredient.measurement_id,
                               quantity: meal_ingredient.quantity)
    end
  end
end
