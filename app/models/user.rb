class User < ApplicationRecord
  audited
  has_many :servers
  has_and_belongs_to_many :tickets
  has_secure_password
  validates :password_digest, presence: true
  validates :password, length: { minimum: 4 }
  validates :username, uniqueness: true
  validates :id, uniqueness: true
end
