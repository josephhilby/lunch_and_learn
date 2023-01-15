require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  validates_presence_of :name
  validates_presence_of :password, on: :create
  validates :email, uniqueness: true, presence: true

  has_secure_password
end
