class Favorite < ApplicationRecord
  has_many :users_favorites
  has_many :users, through: :users_favorites
end
