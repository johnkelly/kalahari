appliances = ["oven", "microwave", "refrigerator", "freezer"]
appliances.each do |appliance|
  appliance = FactoryGirl.create(:appliance, kind: appliance)
end
