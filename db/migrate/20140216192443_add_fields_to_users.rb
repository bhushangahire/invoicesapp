class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :name, :string
    add_column :users, :phone, :integer
    add_column :users, :company_url, :string
  end
end
