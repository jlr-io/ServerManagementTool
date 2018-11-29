class AuditController < ApplicationController
    def index
        @audit = Audit.all
    end
end
