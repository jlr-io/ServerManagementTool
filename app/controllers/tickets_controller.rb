class TicketsController < ApplicationController
  include UsersHelper
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :is_admin, only: [:index]
 
 
def search
  name = '%' + params[:search] + '%'
  @tickets = Ticket.where(['ticket_type LIKE ? OR comments LIKE ?', name, name])
  respond_to do |format|
    format.html
    format.js
  end
end
 
def accepted
  @tickets = Ticket.where(["ticket_type LIKE ? OR comments LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"])
  respond_to do |format|
    format.html
    format.js
  end
end
 
def unaccepted
  @tickets = Ticket.where(["ticket_type LIKE ? OR comments LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"])
  respond_to do |format|
    format.html
    format.js
  end
end
 
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params.merge(admin_id: current_user.id))
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      if (current_user.admin)
        params.require(:ticket).permit(:user_id, :admin_id, :server_id, :ticket_type, :accepted, :complete, :comments)
      else
        params.require(:ticket).permit(:user_id, :server_id, :ticket_type, :comments)
      end
    end
end
