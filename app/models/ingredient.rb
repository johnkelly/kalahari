class Ingredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :food
  belongs_to :measurement

  validates :quantity, presence: true
  validates :food_id, presence: true, uniqueness: { scope: :user_id }
  validates :measurement_id, presence: true
end
