class System < ApplicationRecord
    audited
    belongs_to :server
end
