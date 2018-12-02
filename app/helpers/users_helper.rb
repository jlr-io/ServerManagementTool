module UsersHelper
    
  def is_admin
    unless current_user.admin
      flash[:danger] = "Admin page: not authorized."
      redirect_to(root_url)
    end
  end
  
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user || correct_user.admin
      flash[:danger] = "You are not authorized to do that!"
      redirect_to(root_url)
    end
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end

end
