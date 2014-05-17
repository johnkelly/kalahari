require 'csv'

Appliance.destroy_all
Food.destroy_all
Ingredient.destroy_all
Meal.destroy_all
Measurement.destroy_all
User.destroy_all

puts "Database Cleared"

appliances = ["oven", "microwave", "refrigerator", "freezer", "stove"]
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

puts "User created"

measurements = Measurement.all

Food.all.shuffle.take(200).each do |food|
  FactoryGirl.create(:ingredient, user_id: user.id, meal_id: nil, measurement_id: measurements.sample.id,
                     food_id: food.id, quantity: rand(100))

end

puts "User Ingredients created"

current_id = -1
current_meal = nil

CSV.foreach("#{Rails.root.to_s}/db/csv/meal_ingredients.csv") do |row|
  id = row[0]
  meal_name = row[1]
  food_name = row[2]
  quantity = row[3]
  measurement_name = row[4]

  unless current_id == id
    current_meal = FactoryGirl.create(:meal, name: meal_name)
    current_id = id
  end

  food = Food.where(name: food_name).first_or_create!
  measurement = Measurement.where(name: measurement_name).first_or_create!

  FactoryGirl.create(:ingredient, meal_id: current_meal.id,
                     user_id: nil, food_id: food.id,
                     quantity: quantity, measurement_id: measurement.id)
end

puts "Meals with Ingredients created"

current_id = -1
current_meal = nil

CSV.foreach("#{Rails.root.to_s}/db/csv/meal_directions.csv") do |row|
  id = row[0]
  meal_name = row[1]
  position = row[2]
  direction_name = row[3]

  unless current_id == id
    current_meal = Meal.where(name: meal_name).first
    current_id = id
  end

  FactoryGirl.create(:direction, meal_id: current_meal.id, position: position, name: direction_name)
end

puts "Meal directions created"

current_id = -1
current_meal = nil

CSV.foreach("#{Rails.root.to_s}/db/csv/meal_appliances.csv") do |row|
  id = row[0]
  meal_name = row[1]
  appliance_name = row[2]

  appliance = Appliance.where(kind: appliance_name).first

  unless current_id == id
    current_meal = Meal.where(name: meal_name).first
    current_id = id
  end

  FactoryGirl.create(:meals_appliance, meal_id: current_meal.id, appliance_id: appliance.id)
end

puts "Meal appliances created"
