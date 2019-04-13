class Item < ApplicationRecord

	belongs_to :user, foreign_key: 'user_id',optional: true
    belongs_to :brand,foreign_key: 'brand_id', optional: true
    has_many   :categorys,through: :item_categorys
    has_many   :comments
    has_many   :photos
    has_one    :review

    accepts_nested_attributes_for :photos
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region, primary_key: :region_id
  belongs_to_active_hash :way, primary_key: :method_id
  belongs_to_active_hash :fee_side, primary_key: :fee_side_id
  belongs_to_active_hash :day, primary_key: :date_id
  belongs_to_active_hash :state, primary_key: :state_id
  belongs_to_active_hash :size, primary_key: :size_id
end
