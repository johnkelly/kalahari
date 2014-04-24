class Meal < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :directions, -> { order(:position) }, dependent: :destroy
  has_many :users_meals, dependent: :destroy
  has_many :users, through: :users_meals

  validates :name, presence: true
end
