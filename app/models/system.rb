class System < ApplicationRecord
    audited
    belongs_to :server
    
    validates :server_id, uniqueness: true
end
