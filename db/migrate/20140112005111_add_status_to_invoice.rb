class AddStatusToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :invoice_status_id, :integer
  end
end
