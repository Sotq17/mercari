class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string  :name,          null: false, index: true
      t.text    :description,   null: false
      t.string  :size,          null: false
      t.string  :brand
      t.string  :state,         null: false
      t.string  :fee_side,      null: false
      t.string  :method,        null: false
      t.string  :region,        null: false
      t.string  :date,          null: false
      t.integer :price,         null: false
      t.integer :like
      t.integer :user_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
