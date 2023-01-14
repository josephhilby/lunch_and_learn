require 'rails_helper'

describe 'Index Recipes API' do
  context 'with valid params' do
    it 'can GET a list of recipes by country', :vcr do

      get "/api/v1/recipes?country=thai"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes[:data].count).to eq(3)

      recipes[:data].each do |reicpe|
        expect(reicpe).to have_key(:id)
        expect(reicpe[:id]).to be_an(Null)

        expect(reicpe).to have_key(:type)
        expect(reicpe[:type]).to be_an(String)

        expect(reicpe).to have_key(:attributes)
        expect(reicpe[:attributes]).to be_an(Hash)

        expect(reicpe[:attributes]).to have_key(:title)
        expect(reicpe[:attributes][:title]).to be_a(String)

        expect(reicpe[:attributes]).to have_key(:url)
        expect(reicpe[:attributes][:url]).to be_a(String)

        expect(reicpe[:attributes]).to have_key(:country)
        expect(reicpe[:attributes][:country]).to be_a(String)

        expect(reicpe[:attributes]).to have_key(:image)
        expect(reicpe[:attributes][:image]).to be_a(String)
      end
    end
	end

  context 'with non-valid params' do
    it 'returns a 404 error', :vcr do
      get "/api/v1/recipes?country=thatplaceoverthere"

      expect(response).not_to be_successful

			error = JSON.parse(response.body, symbolize_names: true)

			expect(response.status).to eq(404)

			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
    end
  end

  context 'with no params' do
    it 'returns a random country, with RESTCountries API', :vcr do
      get "/api/v1/recipes"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes[:data].count).to eq(3)

      recipes[:data].each do |reicpe|
        expect(reicpe).to have_key(:id)
        expect(reicpe[:id]).to be_an(Null)

        expect(reicpe).to have_key(:type)
        expect(reicpe[:type]).to be_an(String)

        expect(reicpe).to have_key(:attributes)
        expect(reicpe[:attributes]).to be_an(Hash)

        expect(reicpe[:attributes]).to have_key(:title)
        expect(reicpe[:attributes][:title]).to be_a(String)

        expect(reicpe[:attributes]).to have_key(:url)
        expect(reicpe[:attributes][:url]).to be_a(String)

        expect(reicpe[:attributes]).to have_key(:country)
        expect(reicpe[:attributes][:country]).to be_a(String)

        expect(reicpe[:attributes]).to have_key(:image)
        expect(reicpe[:attributes][:image]).to be_a(String)
      end
    end
  end
end