class Request < ApplicationRecord
    audited
    belongs_to :user
end
