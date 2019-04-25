class ChangeCollunmToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :birth_year_id, :integer, null: false
    add_column :users, :birth_month_id, :integer, null: false
    add_column :users, :birth_day_id, :integer, null: false
  end
end
