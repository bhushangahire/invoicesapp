class AddIndexToInvoices < ActiveRecord::Migration
  def change
  	add_index :invoices, :slug
  end
end
