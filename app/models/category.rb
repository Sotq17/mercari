class Category < ApplicationRecord
	has_many :items, through: :item_categorys
	has_ancestry
end

# ##Categoryテーブル
# |Column|Type|Options|
# |------|----|-------|
# |genre|string|null :false|
# |subgenre|string|null :false|
# |detail|string|null :false|

# ### Association
# - has_many :items,through: :item_categorys

