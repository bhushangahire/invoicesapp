class UsersController < ApplicationController
	def index
		@users = User.all
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
			redirect_to @user
		else
			render 'new'
		end
	end
	
	def edit
		@user = User.find(params[:id])
		redirect_to @user
	end
end
