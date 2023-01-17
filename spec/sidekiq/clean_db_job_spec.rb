require 'rails_helper'
require 'spec_helper'

RSpec.describe CleanDbJob, type: :job do
  before do
    @select_favorite = create(:favorite)
  end
  describe 'CleanDbJob' do
    it 'perform_async' do
      expect(CleanDbJob.jobs.size).to eq(0)
      CleanDbJob.perform_async('perform', true)

      expect(CleanDbJob.jobs.size).to eq(1)
      expect(CleanDbJob).to have_enqueued_sidekiq_job('perform', true)
    end

    describe '#perform' do
      context 'if select favorite is still joined to a users_favorite' do
        it 'will do nothing' do
          2.times { create(:users_favorite, favorite: @select_favorite) }

          expect(Favorite.all.count).to eq(1)
          CleanDbJob.new.perform(@select_favorite.id)

          expect(Favorite.all.count).to eq(1)
        end
      end

      context 'if select favorite is NOT still joined to a users_favorite' do
        it 'will destroy the select favorite' do
          2.times { create(:users_favorite) }

          expect(Favorite.all.count).to eq(3)

          CleanDbJob.new.perform(@select_favorite.id)
          expect(Favorite.all.count).to eq(2)
        end
      end
    end
  end
end
