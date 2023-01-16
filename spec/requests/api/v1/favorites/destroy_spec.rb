require 'rails_helper'

describe "Destroy Favorites API" do
  before do
    user = create(:user, api_key: 'key')
    @favorite = create(:favorite)
    create(:users_favorite, user: user, favorite: @favorite)
  end
  context 'with valid params' do
    it "can DELETE a select favorite, return JSON response" do
      favorite_params = ({
          api_key: 'key',
          country: @favorite.country,
          recipe_link: @favorite.recipe_link,
          recipe_title: @favorite.recipe_title
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      delete "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      destroyed_favorite = JSON.parse(response.body, symbolize_names: true)

      expect(destroyed_favorite.size).to eq(1)
      expect(destroyed_favorite).to have_key(:success)
      expect(destroyed_favorite[:success]).to eq("Favorite removed successfully")
    end
  end

  context 'with non-valid params[:api_key]' do
    it 'will return an error' do
      favorite_params = ({
          api_key: 'not_the_key',
          country: @favorite.country,
          recipe_link: @favorite.recipe_link,
          recipe_title: @favorite.recipe_title
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      delete "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

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
      favorite_params = ({
          api_key: 'key',
          recipe_link: @favorite.recipe_link,
          recipe_title: @favorite.recipe_title
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      delete "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

      expect(response).not_to be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
			expect(error[:message]).to eq('Not Found')
    end
  end
end