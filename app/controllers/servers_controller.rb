class ServersController < ApplicationController
  before_action do
    logged_in_user
  end
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  # GET /servers.json
  def index
      @servers = Server.all
  end
  
  def approved
      @servers = Server.where(["hostname LIKE ?", "%#{params[:search]}%"])
  end
  
  def pending
      @servers = Server.where(["hostname LIKE ?", "%#{params[:search]}%"])
  end
  
  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = Server.find(params[:id])
    @system = System.find(@server.system.id)
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
