class Favorite < ApplicationRecord
  validates_presence_of :country
  validates_presence_of :recipe_link
  validates_presence_of :recipe_title

  has_many :users_favorites
  has_many :users, through: :users_favorites

  def self.find_select_favorite(favorite_params)
    self.where("country = :country and recipe_link = :recipe_link and recipe_title = :recipe_title", { country: favorite_params[:country], recipe_link: favorite_params[:recipe_link], recipe_title: favorite_params[:recipe_title] }).first
  end
end
