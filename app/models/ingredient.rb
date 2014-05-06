class Ingredient < ActiveRecord::Base
  belongs_to :food
  belongs_to :measurement
  belongs_to :user
  belongs_to :meal

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food_id, presence: true, uniqueness: { scope: :user_id }
  validates :measurement_id, presence: true

  def mL
    @mL ||= measurement.mL * quantity
  end
end
