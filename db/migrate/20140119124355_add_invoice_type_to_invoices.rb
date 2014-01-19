class AddInvoiceTypeToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :invoice_type_col, :string
  end
end
