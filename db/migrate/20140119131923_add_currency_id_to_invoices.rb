class AddCurrencyIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :currency_id, :integer
  end
end
