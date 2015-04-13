class Idea < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joins_users, through: :joins, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_user, through: :likes, source: :user
end
