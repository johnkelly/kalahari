class Meal < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :directions, -> { order(:position) }, dependent: :destroy
  has_many :users_meals, dependent: :destroy
  has_many :users, through: :users_meals
  has_many :meals_appliances, dependent: :destroy
  has_many :appliances, through: :meals_appliances

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
