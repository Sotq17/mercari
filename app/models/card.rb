class Card < ApplicationRecord
  belongs_to  :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :expiration_year
  belongs_to_active_hash :expiration_month
end
