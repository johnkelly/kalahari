class UsersMeal < ActiveRecord::Base
  belongs_to :meal
  belongs_to :user

  validates :meal_id, presence: true
  validates :user_id, presence: true
end
