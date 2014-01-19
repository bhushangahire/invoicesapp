class AddStatusBoolToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :paid, :bool, default: false
  end
end
