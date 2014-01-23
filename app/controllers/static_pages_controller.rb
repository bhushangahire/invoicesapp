class StaticPagesController < ApplicationController
	
	def home
		if signed_in?
			@invoices = current_user.invoices
			@clients = current_user.clients
		end

	end
	
	def signup
	
	end

end
