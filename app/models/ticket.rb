class Ticket < ApplicationRecord
    audited
    has_and_belongs_to_many :users
end
