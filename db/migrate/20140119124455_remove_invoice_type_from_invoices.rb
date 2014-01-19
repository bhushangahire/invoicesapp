class RemoveInvoiceTypeFromInvoices < ActiveRecord::Migration
	def up
		remove_column :invoices, :invoice_type
	end
	def down
		add_column :invoices, :invoice_type
	end
end
