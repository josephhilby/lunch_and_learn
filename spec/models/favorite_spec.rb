require 'rails_helper'

RSpec.describe Favorite, type: :model do
    describe 'relationships' do
    it { should have_many(:users_favorites) }
    it { should have_many(:users).through(:users_favorites) }
  end
end
