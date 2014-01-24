module SessionsHelper
	
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		current_user = user
	end
	
	def signed_in?
		!current_user.nil?
	end
	
	def current_user=(user)
		@current_user = user
	end
	
	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end
	
	def current_user?(user)
		user == current_user
	end
	
	def sign_out
		current_user = nil
		cookies.delete(:remember_token)
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
	
	# method to check that user is checking their own clients' invoices
	def correct_user?
		current_user.id == @client.user_id
	end
	
	# method to check that unauthorised user does not have access to invoice controls
	def authorised?
		current_user == @user
	end
end


