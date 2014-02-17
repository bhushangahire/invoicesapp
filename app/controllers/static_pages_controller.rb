class StaticPagesController < ApplicationController
	
	def home
		if signed_in?
			redirect_to invoices_path
		else
			render layout: "homepage_layout"
		end

	end
	
	def signup
		
	end
	
	def about
		render layout: "homepage_layout"
	end

end
