class User < ApplicationRecord
  validates :email, presence: true
  validates :username, presence: true
  validates : remember_token, presence: true
  
  has_secure_password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
end
