class ChangeColumnToUser5 < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :card_number, :integer, null: false
    remove_column :users, :security_code, :integer, null: false
  end
end
