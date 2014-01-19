class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
    	t.string :title
    	t.string :symbol

      t.timestamps
    end
  end
end
