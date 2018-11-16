class DashboardController < ApplicationController
  before_action do
    logged_in_user
  end

  def index
    @servers = Server.all
  end
end
