class Server < ApplicationRecord
  belong_to :user

  scope :approved, -> {where (approved=true)}
  scope :pending, -> {where (approved=false)}
end
