require 'csv'

Appliance.destroy_all
Ingredient.destroy_all
Measurement.destroy_all
Food.destroy_all
User.destroy_all

puts "Database Cleared"

appliances = ["oven", "microwave", "refrigerator", "freezer"]
appliances.each do |appliance|
  appliance = FactoryGirl.create(:appliance, kind: appliance)
end

puts "Appliances seeded"

measurements = ["ounces", "liters", "pounds", "cups", "item", "tablespoons", "teaspoons"]
measurements.each do |measurement|
  measurement = FactoryGirl.create(:measurement, name: measurement)
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
  FactoryGirl.create(:ingredient, user_id: user.id, measurement_id: measurements.sample.id,
                     food_id: food.id, quantity: rand(100))

end

puts "Ingredients created"

