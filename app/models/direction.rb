class Direction < ActiveRecord::Base
  belongs_to :meal

  validates :meal_id, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
end
