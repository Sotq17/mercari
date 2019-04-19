class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string  :name
    end
  end
end

# ##Categoryテーブル
# |Column|Type|Options|
# |------|----|-------|
# |genre|string|null :false|
# |subgenre|string|null :false|
# |detail|string|null :false|

# ### Association
# - has_many :items,through: :item_categorys
