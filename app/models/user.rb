class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, format: /.+@.+/, uniqueness: true
  validates :password, confirmation: true, on: :create, length: { minimum: 5 }
  validates :password_confirmation, presence: true
end