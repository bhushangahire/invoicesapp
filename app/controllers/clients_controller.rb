class ClientsController < ApplicationController
	 before_action :set_client, only: [:destroy]

	def index
		@clients = current_user.clients
	end
	
	def show
		@clients = current_user.clients
		render 'index'
	end
	
	def new
		@client = Client.new
	end
	
	def create
		@client = Client.new(client_params)
		@client.user_id = current_user.id
		if @client.save
			flash[:success] = "Client created."
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
	
	def client_params
		params.require(:client).permit(:name, :address, :user_id, :email)
	end
end
