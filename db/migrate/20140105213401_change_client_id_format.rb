class ChangeClientIdFormat < ActiveRecord::Migration
  def change
  
  		change_column :invoices, :client_id, :Integer
  
  end
end
