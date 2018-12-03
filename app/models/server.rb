class Server < ApplicationRecord
    audited
    belongs_to :user
    has_one :system
    
    #validates :id, presence: true, uniqueness: true
    validates :user_id, presence: true
    validates :hostname, presence: true
    validates :location, presence: true
    validates :eng_team_sme_contact_id, presence: true
    validates :eng_team_manager_contact_id, presence: true
    validates :os_requested, presence: true
    
    def self.approved
    end
end

