class User < ApplicationRecord
  validates :email, presence: true, length: { in: 20...150 }
  validates :username, presence: true, length: { in: 20...150 }
  validates :password, presence: true, length: { in: 4...50 }
  password_confirmation, presence: true, length: { in: 4...50 }
  has_secure_password
end
