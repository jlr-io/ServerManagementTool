class DashboardController < ApplicationController
  before_action do
    logged_in_user
  end

  def employee
    if current_user.admin == true
      redirect_to admin_path
    end
  end

  def admin
    if current_user.admin == false
      redirect_to employee_path
    end
  end
  def index
    @servers = Server.all
  end
end
