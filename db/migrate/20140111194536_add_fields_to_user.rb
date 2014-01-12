class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_title, :string
    add_column :users, :user_tagline, :string
    add_column :users, :user_phone, :integer
    add_column :users, :user_weburl, :string
  end
end
