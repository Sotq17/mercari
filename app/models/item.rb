class Item < ApplicationRecord
	belongs_to :user
    belongs_to :brand
    has_many   :categorys,through: :item_categorys
    has_many   :comments
    has_many   :photos
    has_one    :review
end
