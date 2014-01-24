class InvoiceMailer < ActionMailer::Base
  default from: "goobimama@gmail.com"
  
  def send_receipt(user)
  	mail(to: "goobimama@gmail.com", subject: "Receipt")
  end
end
