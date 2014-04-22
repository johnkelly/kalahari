class Ingredient < ActiveRecord::Base
  belongs_to :food
  belongs_to :measurement
  belongs_to :user
  belongs_to :meal

  validates :quantity, presence: true
  validates :food_id, presence: true, uniqueness: { scope: :user_id }
  validates :measurement_id, presence: true
end
