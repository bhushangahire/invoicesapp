class AddEstimateBoolToInvoice < ActiveRecord::Migration
  def change
  	add_column :invoices, :invoice_type, :integer
  end
end
