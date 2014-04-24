class MealSerializer < ActiveModel::Serializer
  has_many :directions
  has_many :ingredients

  attributes :id, :name
end
