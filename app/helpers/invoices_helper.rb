module InvoicesHelper
	
	def isEstimate?
		@invoice.invoice_type == "Estimate"
	end

end
