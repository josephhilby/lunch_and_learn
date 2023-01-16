require 'rails_helper'

describe "Index Favorites API" do
  before do
    user = create(:user, api_key: 'key')
    3.times { create(:favorite) }
    favorites = Favorite.all
    favorites.each do |favorite|
      create(:users_favorite, user: user, favorite: favorite)
    end
  end
  context ' with valid params' do
    it "can GET a list of favorite, return JSON response" do

      get "/api/v1/favorites?api_key=key"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      index_favorites = JSON.parse(response.body, symbolize_names: true)

      expect(index_favorites.size).to eq(1)
      expect(index_favorites).to have_key(:data)
      expect(index_favorites[:data]).to be_a(Array)

      index_favorites[:data].each do |data|
        expect(data.size).to eq(3)
        expect(data).to have_key(:id)
        expect(data[:id]).to be_an(String)

        expect(data).to have_key(:type)
        expect(data[:type]).to be_an(String)
        expect(data[:type]).to eq('favorite')

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_an(Hash)
        expect(data[:attributes].size).to eq(4)

        expect(data[:attributes]).to have_key(:recipe_title)
        expect(data[:attributes][:recipe_title]).to be_a(String)

        expect(data[:attributes]).to have_key(:recipe_link)
        expect(data[:attributes][:recipe_link]).to be_a(String)

        expect(data[:attributes]).to have_key(:country)
        expect(data[:attributes][:country]).to be_a(String)

        expect(data[:attributes]).to have_key(:created_at)
        expect(data[:attributes][:created_at]).to be_a(String)
      end
    end
  end

  context 'with non-valid params[:api_key]' do
    it 'will return an error' do

      get "/api/v1/favorites?api_key=not_the_key"

      expect(response).not_to be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
			expect(error[:message]).to eq("Invalid or missing api_key")
    end
  end

  context 'with missing params' do
    it 'will return an error' do

      get "/api/v1/favorites"

      expect(response).not_to be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
			expect(error[:message]).to eq("Invalid or missing api_key")
    end
  end
end