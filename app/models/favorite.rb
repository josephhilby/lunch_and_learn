class Favorite < ApplicationRecord
  validates_presence_of :country
  validates_presence_of :recipe_link
  validates_presence_of :recipe_title

  has_many :users_favorites
  has_many :users, through: :users_favorites
end
