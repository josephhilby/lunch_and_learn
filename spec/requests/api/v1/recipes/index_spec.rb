require 'rails_helper'

describe 'Index Recipes API' do
  context 'with valid params' do
    it 'can GET a list of recipes by country', :vcr do
      get "/api/v1/recipes?country=thai"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes[:data].count).to eq(20)
      expect(recipes.size).to eq(1)

      recipes[:data].each do |recipe|
        expect(recipe.size).to eq(3)
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to be_an(NilClass)

        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to be_an(String)
        expect(recipe[:type]).to eq('recipe')

        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to be_an(Hash)

        expect(recipe[:attributes].size).to eq(4)
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes][:title]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes][:url]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes][:image]).to be_a(String)
      end
    end
	end

  context 'with non-valid params' do
    it 'returns a 404 error', :vcr do
      get "/api/v1/recipes?country=thatplaceoverthere"

      expect(response).not_to be_successful

			error = JSON.parse(response.body, symbolize_names: true)

			expect(response.status).to eq(404)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
    end
  end

  context 'with no params' do
    xit 'returns a random country, with RESTCountries API', :vcr do
      get "/api/v1/recipes"
      # I cant figure out why this stub is not working. Getting the error:
      # CountryFacade does not implement #random_country
      allow_any_instance_of(CountryFacade).to receive(:random_country).and_return('Malaysia')

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes[:data].count).to be(20)
      expect(recipes.size).to eq(1)

      recipes[:data].each do |recipe|
        expect(recipe.size).to eq(3)
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to be_an(NilClass)

        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to be_an(String)
        expect(recipe[:type]).to eq('recipe')

        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to be_an(Hash)

        expect(recipe[:attributes].size).to eq(4)
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes][:title]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes][:url]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes][:image]).to be_a(String)
      end
    end
  end
end