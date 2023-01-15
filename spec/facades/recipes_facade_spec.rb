require 'rails_helper'

RSpec.describe RecipesFacade do
	describe 'class_methods' do
		describe '.get_recipes' do
      context 'with valid params' do
        it 'returns an Array of Recipe objects', :vcr do
          expect(RecipesFacade.get_recipes('Thailand')).to be_a(Array)
          expect(RecipesFacade.get_recipes('Thailand').first).to be_a(Recipe)
        end
      end

      context 'witn non-valid params' do
        it 'returns an empity Array', :vcr do
          expect(RecipesFacade.get_recipes('xkcd')).to eq([])
          expect(RecipesFacade.get_recipes('')).to eq([])
        end
      end
		end

		describe '.results' do
      context 'with valid params' do
        it 'returns an Array of recipes from that country', :vcr do
          expect(RecipesFacade.results('Thailand')).to be_a(Array)

          first_result = RecipesFacade.results('Thailand').first
          expect(first_result).to be_a(Hash)
          expect(first_result).to have_key(:recipe)
          expect(first_result[:recipe]).to be_a(Hash)


          expect(first_result[:recipe]).to have_key(:label)
          expect(first_result[:recipe][:label]).to be_a(String)

          expect(first_result[:recipe]).to have_key(:uri)
          expect(first_result[:recipe][:uri]).to be_a(String)

          expect(first_result[:recipe]).to have_key(:image)
          expect(first_result[:recipe][:image]).to be_a(String)
        end
      end

      context 'with non-vlid params' do
        it 'returns an empity Array', :vcr do
          expect(RecipesFacade.results('xkcd')).to eq([])
          expect(RecipesFacade.results('')).to eq([])
        end
      end
		end
	end
end