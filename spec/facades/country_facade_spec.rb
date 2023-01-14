require 'rails_helper'

RSpec.describe CountryFacade do
	describe 'class_methods' do
		describe '.random_country' do
			it 'returns a String of the "common name" of a randomly selected country', :vcr do
				expect(CountryFacade.random_country).to be_a(String)
			end
		end

		describe '.is_a_country' do
      context 'with valid params' do
        it 'returns a String', :vcr do
          expect(CountryFacade.is_a_country('thai')).to be_a(String)
          expect(CountryFacade.is_a_country('thai')).to eq('Thailand')
        end
      end

      context 'witn non-valid params' do
        it 'returns nil', :vcr do
          expect(CountryFacade.is_a_country('xkcd')).to be_a(NilClass)
        end
      end
		end

		describe '.results' do
      context 'with valid params' do
        it 'returns an Array of countries matching given param', :vcr do
          expect(CountryFacade.results('thai')).to be_a(Hash)
          expect(CountryFacade.results('thai')).to have_key(:name)
          expect(CountryFacade.results('thai')[:name]).to be_a(Hash)
          expect(CountryFacade.results('thai')[:name]).to have_key(:common)
          expect(CountryFacade.results('thai')[:name][:common]).to be_a(String)
          expect(CountryFacade.results('thai')[:name][:common]).to eq('Thailand')
        end
      end

      context 'with non-vlid params' do
        it 'returns nil', :vcr do
          expect(CountryFacade.is_a_country('xkcd')).to be_a(NilClass)
          expect(CountryFacade.is_a_country('')).to be_a(NilClass)
        end
      end
		end
	end
end