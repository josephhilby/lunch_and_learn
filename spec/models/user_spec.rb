require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:users_favorites) }
    it { should have_many(:favorites).through(:users_favorites) }
  end

  describe 'dependent destroy' do
    it 'will destroy associated users_favorite records' do
      user = create(:user)
      favorite = create(:favorite)
      create(:users_favorite, user: user, favorite: favorite)

      expect { user.destroy }.to change { UsersFavorite.count }.by(-1)
    end
  end
end
