class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.string :item_title
      t.string :item_date
      t.integer :item_amount
      t.integer :invoice_id

      t.timestamps
    end
  end
end
