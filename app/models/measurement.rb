class Measurement < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
