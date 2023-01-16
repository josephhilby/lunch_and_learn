class UsersFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorite
end