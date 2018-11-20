class Server < ApplicationRecord
    audited
    belongs_to :user
    has_one :system
    
   scope :approved, ->{
        where(:approved => true)
   }
   scope :pending, ->{
        where(:approved=> false)
   }
end

