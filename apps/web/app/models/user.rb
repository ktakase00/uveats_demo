class User < ApplicationRecord
  has_secure_password
  validates :mail, presence: true
end
