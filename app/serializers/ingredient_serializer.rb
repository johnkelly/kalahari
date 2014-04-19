class IngredientSerializer < ActiveModel::Serializer
  has_one :food
  has_one :measurement

  attributes :id, :quantity
end
