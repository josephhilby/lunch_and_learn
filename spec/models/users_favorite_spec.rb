require 'rails_helper'

RSpec.describe UsersFavorite, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:favorite) }
  end
end