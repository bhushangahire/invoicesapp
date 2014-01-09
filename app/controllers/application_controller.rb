class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def sign_in(user)
  	cookies.permanent[:remember_token] = user.remember_token
  	current_user = user
  end
  
  def store_location
  	session[:return_to] = request.fullpath
  end
  
  def redirect_back_or(default)
  	redirect_to(session[:return_to] || default)
  	session.delete(:return_to)
  end
  
  def signed_in_user
  	unless signed_in?
  		store_location
  		redirect_to signin_path, notice: "Please sign in." 
  	end
  end
  
  def sign_out
  	current_user = nil
  	cookies.delete(:remember_token)
  end
  
end
