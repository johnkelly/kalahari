class Ingredient < ActiveRecord::Base
  belongs_to :food
  belongs_to :measurement
  belongs_to :user
  belongs_to :meal

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food_id, presence: true
  validates :food_id, uniqueness: { scope: :user_id }, if: Proc.new {|i| i.user_id.present? }
  validates :food_id, uniqueness: { scope: :meal_id }, if: Proc.new {|i| i.meal_id.present? }
  validates :measurement_id, presence: true

  def mL
    @mL ||= measurement.mL * quantity
  end
end
