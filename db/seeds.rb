Appliance.destroy_all
Measurement.destroy_all

appliances = ["oven", "microwave", "refrigerator", "freezer"]
appliances.each do |appliance|
  appliance = FactoryGirl.create(:appliance, kind: appliance)
end

measurements = ["ounces", "liters", "pounds", "cups", "item", "tablespoons", "teaspoons"]
measurements.each do |measurement|
  measurement = FactoryGirl.create(:measurement, name: measurement)
end
