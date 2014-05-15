class MealsAppliance < ActiveRecord::Base
  belongs_to :meal
  belongs_to :appliance

  validates :meal_id, presence: true
  validates :appliance_id, presence: true, uniqueness: { scope: :meal_id }
end

