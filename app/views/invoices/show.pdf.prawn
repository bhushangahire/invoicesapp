prawn_document() do |pdf|
  pdf.text "Invoice ##{@invoice.id}"
  
  items = @invoice.invoice_items.map do |item|
  	[
  		item.item_title,
  		item.item_desc,
  		item.item_amount
  	]
  end
  
	headers = [["Item", "Description", "Amount"]]
	headers += items
	pdf.table(headers, :header => true)
end