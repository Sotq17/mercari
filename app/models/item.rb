class Item < ApplicationRecord

	  belongs_to :user, foreign_key: 'user_id'
    belongs_to :buyer, class_name: "User", foreign_key: :buyer_id, optional: true
    belongs_to :brand,foreign_key: 'brand_id', optional: true
    has_many   :categories,through: :item_categories
    has_many   :comments
    has_many   :photos, dependent: :destroy
    has_one    :review
    has_many   :item_categories, dependent: :destroy

    validates :name, presence: true
    validates :description,  presence: true

    accepts_nested_attributes_for :photos
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  belongs_to_active_hash :way
  belongs_to_active_hash :fee_side
  belongs_to_active_hash :day
  belongs_to_active_hash :state
  belongs_to_active_hash :size

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end
  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end
