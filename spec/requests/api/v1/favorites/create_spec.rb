require 'rails_helper'

describe "Create Favorites API" do
  context ' with valid params' do
    it "can POST a new favorite, return JSON response" do
      create(:user, api_key: 'key')
      favorite_params = ({
          api_key: 'key',
          country: 'country',
          recipe_link: 'link',
          recipe_title: 'title'
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_favorite = JSON.parse(response.body, symbolize_names: true)

      expect(created_favorite.size).to eq(1)
      expect(created_favorite).to have_key(:success)
      expect(created_favorite[:success]).to eq("Favorite added successfully")
    end
  end

  context 'with non-valid params[:api_key]' do
    it 'will return an error' do
      create(:user, api_key: 'key')
      favorite_params = ({
          api_key: 'nkey',
          country: 'country',
          recipe_link: 'link',
          recipe_title: 'title'
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

      expect(response).not_to be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
			expect(error[:message]).to eq("Invalid api_key")
    end
  end

  context 'with missing params' do
    it 'will return an error' do
      create(:user, api_key: 'key')
      favorite_params = ({
          api_key: 'key',
          recipe_link: 'link',
          recipe_title: 'title'
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

      expect(response).not_to be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
			expect(error[:message]).to eq("Country can't be blank")
    end
  end
end