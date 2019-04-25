class ChangeColumnToUser4 < ActiveRecord::Migration[5.0]
  def change
  	  remove_column :users, :expairtion_year_id, :integer, null: false
      remove_column :users, :expairtion_month_id, :integer, null: false
      add_column :users, :expiration_year_id, :integer, null: false
      add_column :users, :expiration_month_id, :integer, null: false
  end
end
