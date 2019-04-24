class ChangeColumnToUser2 < ActiveRecord::Migration[5.0]
  def change
  	 	add_column :users, :last_name, :string, null: false
      add_column :users, :first_name, :string, null: false
      add_column :users, :last_kana, :string, null: false
      add_column :users, :first_kana, :string, null: false
      add_column :users, :adress, :text, null: false
      add_column :users, :postal_code, :integer, null: false
      add_column :users, :prefecture, :string, null: false
      add_column :users, :building, :string
      add_column :users, :city, :string, null: false
      add_column :users, :phone, :integer, null: false
  end
end
