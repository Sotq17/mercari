class ChangeColumnToItem2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :method_id, :integer, null: false
    remove_column :items, :date_id, :integer, null: false
    add_column :items, :way_id, :integer, null: false
    add_column :items, :day_id, :integer, null: false
  end
end
