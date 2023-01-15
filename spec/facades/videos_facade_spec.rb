require 'rails_helper'

RSpec.describe VideosFacade do
	describe 'class_methods' do
		describe '.get_videos' do
      context 'with valid params' do
        it 'returns an Array of Video objects', :vcr do
          expect(VideosFacade.get_videos('Thailand')).to be_a(Array)
          expect(VideosFacade.get_videos('Thailand').first).to be_a(Video)
        end
      end

      context 'witn non-valid params' do
        it 'returns an empty Array', :vcr do
          expect(VideosFacade.get_videos('xkcd')).to eq([])
        end
      end
		end

		describe '.results' do
      context 'with valid params' do
        it 'returns an Array of videos matching given param', :vcr do
          expect(VideosFacade.results('Poland')).to be_a(Array)

          first_result = VideosFacade.results('Poland').first
          expect(first_result).to be_a(Hash)
          expect(first_result).to have_key(:id)
          expect(first_result[:id]).to be_a(Hash)

          expect(first_result[:id]).to have_key(:videoId)
          expect(first_result[:id][:videoId]).to be_a(String)

          expect(first_result).to have_key(:snippet)
          expect(first_result[:snippet]).to be_a(Hash)

          expect(first_result[:snippet]).to have_key(:title)
          expect(first_result[:snippet][:title]).to be_a(String)
        end
      end

      context 'with non-vlid params' do
        it 'returns an empity Array', :vcr do
          expect(VideosFacade.results('xkcd')).to eq([])
        end
      end
		end
	end
end