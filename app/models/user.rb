class User < ApplicationRecord
  audited
  has_many :servers, :requests
  has_secure_password
  validates :password_digest, presence: true
  validates :password, length: { minimum: 4 }
  validates :username, uniqueness: true
  validates :id, uniqueness: true
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
