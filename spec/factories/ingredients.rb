# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    quantity "10.5"
    food_id "fakeid"
    measurement_id "fakeid"
    user_id "fakeid"
  end
end
