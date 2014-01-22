class InvoiceMailer < ActionMailer::Base
  default from: "goobimama@gmail.com"
  
  def send_receipt(user)
  	mail(to: "goobimama@me.com", subject: "Receipt")
  end
end
