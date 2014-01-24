class InvoiceMailer < ActionMailer::Base
  default from: "Hash Cookies Invoice <goobimama@gmail.com>"
  
  def send_receipt(invoice)
  	@invoice = invoice
  	@client = Client.find(@invoice.client_id)
  	mail(to: @client.email, subject: "Receipt")
  end
end
