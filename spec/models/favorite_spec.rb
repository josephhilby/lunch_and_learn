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

  describe 'class_methods' do
    describe '.find_select_favorite' do
      it 'returns a favorite selected by favorite_params' do
        favorite = create(:favorite)
        10.times { create(:favorite) }
        params = {
          country: favorite.country,
          recipe_link: favorite.recipe_link,
          recipe_title: favorite.recipe_title
        }

        expect(Favorite.find_select_favorite(params)).to eq(favorite)
      end
    end
  end
end
