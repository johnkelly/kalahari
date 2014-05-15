class UsersMealSerializer < ActiveModel::Serializer
  has_one :meal

  attributes :id, :scheduled_at

  def scheduled_at
    object.scheduled_at.strftime('%m-%d-%Y')
  end
end
