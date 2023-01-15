require 'rails_helper'

RSpec.describe ImagesFacade do
	describe 'class_methods' do
		describe '.get_images' do
      context 'with valid params' do
        it 'returns an Array of Image objects', :vcr do
          expect(ImagesFacade.get_images('Thailand')).to be_a(Array)
          expect(ImagesFacade.get_images('Thailand').first).to be_a(Image)
        end
      end

      context 'witn non-valid params' do
        it 'returns an empty Array', :vcr do
          expect(ImagesFacade.get_images('xkcd')).to eq([])
          expect(ImagesFacade.get_images('')).to eq([])
        end
      end
		end

		describe '.results' do
      context 'with valid params' do
        it 'returns an Array of images matching given param', :vcr do
          expect(ImagesFacade.results('Thailand')).to be_a(Array)

          first_result = ImagesFacade.results('Thailand').first
          expect(first_result).to be_a(Hash)
          expect(first_result).to have_key(:url)
          expect(first_result[:url]).to be_a(String)


          expect(first_result).to have_key(:alt)
          expect(first_result[:alt]).to be_a(String)
        end
      end

      context 'with non-vlid params' do
        it 'returns an empity Array or nil', :vcr do
          expect(ImagesFacade.results('xkcd')).to eq([])
          expect(ImagesFacade.results('')).to eq(nil)
        end
      end
		end
	end
end