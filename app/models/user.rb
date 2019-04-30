class User < ApplicationRecord
  has_many   :reviews
  has_many   :comments
  has_many   :items
  has_one    :profile
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "user_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "user_id", class_name: "Item"

  has_one    :card
  has_many :items, through: :purchases
  has_many :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
		belongs_to_active_hash :birth_year
		belongs_to_active_hash :birth_month
		belongs_to_active_hash :birth_day
    belongs_to_active_hash :region
    belongs_to_active_hash :expiration_year
    belongs_to_active_hash :expiration_month
end
