class User < ApplicationRecord
  has_many   :reviews
  has_many   :comments
  has_many   :items
  has_one    :profile
  has_one    :card

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end