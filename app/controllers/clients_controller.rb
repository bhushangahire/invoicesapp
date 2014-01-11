class ClientsController < ApplicationController
	 before_action :set_client, only: [:destroy]

	def index
		@user ||= User.find_by_remember_token(cookies[:remember_token])
		@clients = @user.clients
	end
	
	def show
		@user ||= User.find_by_remember_token(cookies[:remember_token])
		@clients = @user.clients
		render 'index'
	end
	
	def new
		@client = Client.new
	end
	
	def create
		@client = Client.new(params[:client])
		@client.user_id = User.find_by_remember_token(cookies[:remember_token]).id
		if @client.save
			flash[:success] = "Welcome to new user"
			redirect_to @client
		else
			render 'new'
		end
	end
	
	def destroy
	  @client.destroy
	  respond_to do |format|
	    format.html { redirect_to clients_url }
	    format.json { head :no_content }
	  end
	end
	
	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_client
	    @client = Client.find(params[:id])
	  end
	
end
