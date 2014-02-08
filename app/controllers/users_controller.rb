class UsersController < ApplicationController
	def index
		@user ||= User.find_by_remember_token(cookies[:remember_token])
		render 'show'
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to new user"
			sign_in @user
			redirect_to @user
		else
			render 'new'
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	
	

end
