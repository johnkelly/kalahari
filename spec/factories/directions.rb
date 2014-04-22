# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :direction do
    meal_id "FAKEID"
    position 0
    name "Set the oven to 350 degrees."
  end
end
