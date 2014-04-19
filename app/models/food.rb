class Food < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
