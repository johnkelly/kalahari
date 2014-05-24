class MealSerializer < ActiveModel::Serializer
  has_many :directions
  has_many :ingredients
  has_many :appliances

  attributes :id, :name, :description, :duration
end
