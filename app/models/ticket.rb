class Ticket < ApplicationRecord
    audited
    has_and_belongs_to_many :users
    
    validates :user_id, presence: true
    validates :server_id, presence: true
end
