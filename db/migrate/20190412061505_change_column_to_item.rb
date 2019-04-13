class ChangeColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :size_id,:integer, null: false
    add_column :items, :state_id,:integer, null: false
    add_column :items, :fee_side_id, :integer, null: false
    add_column :items, :method_id, :integer, null: false
    add_column :items, :region_id, :integer, null: false
    add_column :items, :date_id, :integer, null: false
    remove_column :items, :size,:string, null: false
    remove_column :items, :state,:string, null: false
    remove_column :items, :fee_side, :string, null: false
    remove_column :items, :method, :string, null: false
    remove_column :items, :region, :string, null: false
    remove_column :items, :date, :string, null: false
  end
end
