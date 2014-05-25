class MealSerializer < ActiveModel::Serializer
  has_many :directions
  has_many :ingredients
  has_many :appliances

  attributes :id, :name, :description, :duration, :ingredient_count

  def ingredient_count
    object.ingredients.count
  end
end
