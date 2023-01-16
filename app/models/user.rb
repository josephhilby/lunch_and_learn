require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  validates_presence_of :name
  validates_presence_of :password, on: :create
  validates :email, uniqueness: true, presence: true

  has_secure_password

  has_many :users_favorites, dependent: :destroy
  has_many :favorites, through: :users_favorites
end
