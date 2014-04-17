class User < ActiveRecord::Base
  validates :email, presence: true, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, uniqueness: true
  validates :first_name, presence: true
  validates :password, length: 8..50, if: :password
  validates :auth_token, presence: true

  has_secure_password

  include Authentication
end
