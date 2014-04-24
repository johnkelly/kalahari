class UsersMealSerializer < ActiveModel::Serializer
  has_one :meal

  attributes :id, :scheduled_at
end
