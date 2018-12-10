VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
class User < ApplicationRecord
  audited
  has_many :servers
  has_and_belongs_to_many :tickets
  has_secure_password
  validates :password_digest, presence: true
  validates :password, length: { minimum: 4 }
  validates :username, uniqueness: true,
  presence: true
  validates :email, presence: true,
  uniqueness: { case_sensitive: false},
  length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX }
end
