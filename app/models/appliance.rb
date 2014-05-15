class Appliance < ActiveRecord::Base
  has_many :users_appliances, dependent: :destroy
  has_many :users, through: :users_appliances
  has_many :meals_appliances, dependent: :destroy
  has_many :meals, through: :meals_appliances

  validates :kind, presence: true, uniqueness: true
end
