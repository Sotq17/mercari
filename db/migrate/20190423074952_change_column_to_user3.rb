class ChangeColumnToUser3 < ActiveRecord::Migration[5.0]
  def change
  	  remove_column :users, :prefecture, :string, null: false
  	  add_column :users, :region_id, :integer, null: false
      add_column :users, :card_number, :integer, null: false
      add_column :users, :security_code, :integer, null: false
      add_column :users, :expairtion_year_id, :integer, null: false
      add_column :users, :expairtion_month_id, :integer, null: false
  end
end
