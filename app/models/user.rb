class User < ActiveRecord::Base
  has_many :users_appliances, dependent: :destroy
  has_many :appliances, through: :users_appliances
  has_many :ingredients, dependent: :destroy
  has_many :users_meals, dependent: :destroy
  has_many :meals, through: :users_meals

  validates :email, presence: true, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, uniqueness: true
  validates :first_name, presence: true
  validates :password, length: 8..50, if: :password
  validates :auth_token, presence: true

  has_secure_password

  include Authentication
end
