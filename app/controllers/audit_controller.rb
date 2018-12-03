class AuditController < ApplicationController
    include UsersHelper
    before_action :logged_in_user, only: [:index]
    before_action :is_admin, only: [:index]
    def index
        @audit = Audit.all
    end
end
