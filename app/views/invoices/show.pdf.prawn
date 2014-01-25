prawn_document() do |pdf|
  pdf.text @user.user_company, :size => 18, :styles => [:bold]
  pdf.text "Invoice ##{@invoice.id} #{@invoice.project_title}"
  pdf.text "Dated: #{l @invoice.created_at, :format => :long}"
  
  pdf.stroke_horizontal_rule
  pdf.move_down 20
  
  pdf.text "To," 
  pdf.text @client.name
  pdf.text @client.address
  
  items = @invoice.invoice_items.map do |item|
  	[
  		item.item_title,
  		item.item_desc,
  		item.item_amount
  	]
  end
  
	headers = [["Item", "Description", "Amount"]]
	headers += items
	pdf.table(headers, :header => true, :column_widths => [150, 290, 100])
	
	pdf.text "Total #{@invoice.total_price :item_amount}", :align => :right
	
	pdf.pad(5) { " Text "}

	pdf.text @invoice.notes

	pdf.pad(10) { " Text "}
	
	pdf.text @user.name, :size => 14
	pdf.text @user.user_company
	pdf.text "#{@user.email} | #{@user.user_phone} | #{@user.user_weburl}"
end