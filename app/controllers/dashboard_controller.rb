class DashboardController < ApplicationController
  include UsersHelper
  before_action :logged_in_user, only: [:index]
  
  def index
    @servers = Server.all
  end
end
