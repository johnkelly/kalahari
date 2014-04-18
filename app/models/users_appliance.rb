class UsersAppliance < ActiveRecord::Base
  belongs_to :user
  belongs_to :appliance

  validates :user_id, presence: true
  validates :appliance_id, presence: true, uniqueness: { scope: :user_id }
end
