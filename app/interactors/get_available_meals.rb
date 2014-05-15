class GetAvailableMeals
  include Interactor

  def perform
    context[:available_meals] = meals.select do |meal|
      has_appliances_and_ingredients_and_quantities?(meal)
    end
  end

  def setup
    context[:user] ||= nil
    context[:user_ingredients] ||= user.ingredients.includes(:measurement)
    context[:user_food_ids] ||= user_ingredients.map(&:food_id)
    context[:meals] ||= Meal.all.includes(ingredients: [:measurement, :food])
    context[:user_appliance_ids] ||= user.appliances.map(&:id)
  end

  private

  def has_appliances_and_ingredients_and_quantities?(meal)
    meal_ingredients = meal.ingredients
    user_has_all_appliances?(meal) && user_has_all_ingredients?(meal_ingredients) && has_correct_quantities?(meal_ingredients)
  end

  def user_has_all_ingredients?(meal_ingredients)
    meal_food_ids = meal_ingredients.map(&:food_id)
    (meal_food_ids - user_food_ids).blank?
  end

  def user_has_all_appliances?(meal)
    meal_appliance_ids = meal.appliances.map(&:id)
    (meal_appliance_ids - user_appliance_ids).blank?
  end

  def has_correct_quantities?(meal_ingredients)
    has_correct_quantities = true

    meal_ingredients.each do |meal_ingredient|
      user_ingredient = user_ingredients.detect{|ui| ui.food_id == meal_ingredient.food_id }
      unless has_ingredient_and_correct_quantity?(user_ingredient, meal_ingredient)
        has_correct_quantities = false
        break
      end
    end
    has_correct_quantities
  end

  def has_ingredient_and_correct_quantity?(user_ingredient, meal_ingredient)
    user_ingredient.present? && user_ingredient.mL >= meal_ingredient.mL
  end
end
