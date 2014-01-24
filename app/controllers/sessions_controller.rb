class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by_email(params[:session][:email])
		
		if user && user.authenticate(params[:session][:password])
			flash[:success] = "Welcome back!"
			sign_in user
			redirect_back_or invoices_path
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end
	
	
	
	
end
