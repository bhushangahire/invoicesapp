module SessionsHelper
	
	
	
	def admin_user
		@admin_user ||= User.find_by_remember_token(cookies[:remember_token])
	end
	
	def signed_in?
		!admin_user.nil?
	end
	
	

end
