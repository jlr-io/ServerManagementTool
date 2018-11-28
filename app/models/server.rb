class Server < ApplicationRecord
    audited
    belongs_to :user
    has_one :system
    
    #validates :id, presence: true, uniqueness: true
    validates :user_id, presence: true
   #scope :approved, ->{
    #    where(:approved => true)
   #}
   #scope :pending, ->{
    #    where(:approved=> false)
   #}
end

