class UsersController < ApplicationController
	def index
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
		if !authorised?
			flash[:error] = "Not allowed!"
			redirect_to root_path
		else
			render 'show'
		end
	end
	
	def edit

	end

end
