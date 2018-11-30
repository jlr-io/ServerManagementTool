class Server < ApplicationRecord
    audited
    belongs_to :user
    has_one :system
    
    #validates :id, presence: true, uniqueness: true
    validates :user_id, presence: true
    validates :hostname, presence: true
    
    def self.approved
    end
end

