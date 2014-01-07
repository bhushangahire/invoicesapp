class ChangeInvoiceItemDateToDesc < ActiveRecord::Migration
  def change
  	remove_column :invoice_items, :item_date
  	add_column :invoice_items, :item_desc, :string
  end
end
