class RemoveBrandFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :brand, :string
  end
end
