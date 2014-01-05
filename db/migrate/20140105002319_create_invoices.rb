class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :project_title
      t.string :client_id
      t.text :notes

      t.timestamps
    end
  end
end
