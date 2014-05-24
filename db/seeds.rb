require 'csv'

Appliance.destroy_all
Food.destroy_all
Ingredient.destroy_all
Meal.destroy_all
Measurement.destroy_all
User.destroy_all

puts "Database Cleared"

appliances = ["Oven", "Microwave", "Refrigerator", "Freezer", "Stove", "Tap Water", "Blender", "Food Processor", "Waffle Iron", "Pizza Stone"]
appliances.each do |appliance|
  appliance = FactoryGirl.create(:appliance, kind: appliance)
end

puts "Appliances seeded"

CSV.foreach("#{Rails.root.to_s}/db/csv/measurements.csv") do |row|
  measurement_name = row[0]
  mL = row[1]
  measurement = FactoryGirl.create(:measurement, name: measurement_name, mL: mL)
end

puts "Measurements seeded"

CSV.foreach("#{Rails.root.to_s}/db/csv/food.csv") do |row|
  name = row[0].titleize.singularize
  food = FactoryGirl.create(:food, name: name)
end

puts "Food seeded"

user = FactoryGirl.create(:user, email: "test@example.com")
meal_user = FactoryGirl.create(:user, email: "eat@example.com", first_name: "Eater")

puts "Users created"

Appliance.find_each do |appliance|
  FactoryGirl.create(:users_appliance, user_id: meal_user.id, appliance_id: appliance.id)
end
puts "Users' appliances created"

measurements = Measurement.all

Food.all.shuffle.take(200).each do |food|
  FactoryGirl.create(:ingredient, user_id: user.id, meal_id: nil, measurement_id: measurements.sample.id,
                     food_id: food.id, quantity: rand(100))

end

puts "User Ingredients created"

meals = []

CSV.foreach("#{Rails.root.to_s}/db/csv/meals.csv") do |row|
  meal_name = row[0]
  meal_duration = row[1]
  meal_description = row[2]

  puts meal_name

  meals << FactoryGirl.create(:meal, name: meal_name, duration: meal_duration, description: meal_description)
end

puts "Meals created"

CSV.foreach("#{Rails.root.to_s}/db/csv/meal_ingredients.csv") do |row|
  meal_name = row[0]
  food_name = row[1]
  quantity = row[2]
  measurement_name = row[3]

  current_meal = meals.detect{ |meal| meal.name == meal_name }

  food = Food.where(name: food_name).first_or_create!
  measurement = Measurement.where(name: measurement_name).first_or_create!

  meal_ingredient = FactoryGirl.create(:ingredient, meal_id: current_meal.id,
                                       user_id: nil, food_id: food.id,
                                       quantity: quantity, measurement_id: measurement.id)

  meal_user_ingredient = meal_user.ingredients.where(food_id: food.id).first
  if meal_user_ingredient.present?
    new_amount = Measurement.convert_mL_to_measurement(meal_ingredient.mL, meal_user_ingredient.measurement.mL)
    meal_user_ingredient.increment!(:quantity, new_amount)
  else
    FactoryGirl.create(:ingredient, meal_id: nil,
                       user_id: meal_user.id, food_id: food.id,
                       quantity: quantity, measurement_id: measurement.id)
  end
end

puts "Meals Ingredients created"

CSV.foreach("#{Rails.root.to_s}/db/csv/meal_directions.csv") do |row|
  meal_name = row[0]
  position = row[1]
  direction_name = row[2]

  current_meal = meals.detect{ |meal| meal.name == meal_name }
  FactoryGirl.create(:direction, meal_id: current_meal.id, position: position, name: direction_name)
end

puts "Meal directions created"

CSV.foreach("#{Rails.root.to_s}/db/csv/meal_appliances.csv") do |row|
  meal_name = row[0]
  appliance_name = row[1]

  appliance = Appliance.where(kind: appliance_name).first
  current_meal = meals.detect{ |meal| meal.name == meal_name }

  FactoryGirl.create(:meals_appliance, meal_id: current_meal.id, appliance_id: appliance.id)
end

puts "Meal appliances created"
