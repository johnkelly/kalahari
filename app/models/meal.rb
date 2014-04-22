class Meal < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :directions, -> { order(:position) }, dependent: :destroy

  validates :name, presence: true
end
