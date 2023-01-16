require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:recipe_link) }
    it { should validate_presence_of(:recipe_title) }
  end
  describe 'relationships' do
    it { should have_many(:users_favorites) }
    it { should have_many(:users).through(:users_favorites) }
  end
end
