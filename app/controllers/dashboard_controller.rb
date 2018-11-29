class DashboardController < ApplicationController
  before_action :logged_in?, only: [:index]

  def employee
    if current_user.employee == true
      redirect_to employee_path
    end
  end

  def admin
    if current_user.admin == false
      redirect_to admin_path
    end
  end
  
  def index
    @servers = Server.all
  end
end
