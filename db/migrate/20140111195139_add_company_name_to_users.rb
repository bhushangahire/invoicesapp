class AddCompanyNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_company, :string
  end
end
