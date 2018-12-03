class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :is_admin, only: [:edit, :update, :destroy]
  # GET /servers
  # GET /servers.json
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end

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
  
  def search
    hostname = params[:search] + '%'
    @servers = Server.where(['hostname LIKE ?', hostname])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def index
      @servers = Server.all
  end
  
  def pending
    @servers = Server.where(["hostname LIKE ?", "%#{params[:search]}%"])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def approved
    @servers = Server.where(["hostname LIKE ?", "%#{params[:search]}%"])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def approved_search
     hostname = params[:search] + '%'
    @servers = Server.where(['hostname LIKE ?', hostname])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = Server.find(params[:id])
    unless @server.system.nil?
      @system = System.find(@server.system.id)
    end
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    redirect_back(fallback_location:employee_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      if (current_user.admin)
        params.require(:server).permit(:user_id, :approved, :hostname, :location, :environment, :os_requested, :disk_size, :eng_team_sme_contact_id, :eng_team_manager_contact_id, :application_sme_id, :application_team_distro_group, :application_manager_id, :application_director_id, :line_of_business, :virtual_machine, :asset)
      else
        params.require(:server).permit(@current_user.id, :approved, :hostname, :location, :environment, :os_requested, :disk_size, :eng_team_sme_contact_id, :eng_team_manager_contact_id, :application_sme_id, :application_team_distro_group, :application_manager_id, :application_director_id, :line_of_business, :virtual_machine, :asset)
      end
    end
end
