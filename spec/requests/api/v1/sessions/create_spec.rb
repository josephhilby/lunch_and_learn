require 'rails_helper'

describe "Create Sessions API" do
  before do
    User.create(name: 'name', email: 'email@user.com', password: 'password', password_confirmation: 'password', api_key: '123')
  end

  context ' with valid params' do
    it "can POST a new user, return JSON response" do
      user_params = ({
          email: 'email@user.com',
          password: 'password'
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(user: user_params)

      expect(response).to be_successful

      created_user = JSON.parse(response.body, symbolize_names: true)

      expect(created_user.size).to eq(1)
      data = created_user[:data]

      expect(data.size).to eq(3)
      expect(data).to have_key(:id)
      expect(data[:id]).to be_an(String)

      expect(data).to have_key(:type)
      expect(data[:type]).to be_an(String)
      expect(data[:type]).to eq('user')

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_an(Hash)
      expect(data[:attributes].size).to eq(3)

      expect(data[:attributes]).to have_key(:name)
      expect(data[:attributes][:name]).to be_a(String)
      expect(data[:attributes][:name]).to eq('name')

      expect(data[:attributes]).to have_key(:email)
      expect(data[:attributes][:email]).to be_a(String)
      expect(data[:attributes][:email]).to eq('email@user.com')

      expect(data[:attributes]).to have_key(:api_key)
      expect(data[:attributes][:api_key]).to be_a(String)
      expect(data[:attributes][:api_key]).to eq('123')
    end
  end

  context 'with non-valid params' do
    it 'will return an error' do
      user_params = ({
          email: 'not_the_email',
          password: 'password'
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(user: user_params)

      expect(response).not_to be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
			expect(error[:message]).to eq("Unknown username or password")
    end
  end

  context 'with missing params' do
    it 'will return an error' do
      user_params = ({
          password: 'password'
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(user: user_params)

      expect(response).not_to be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)

      expect(error.size).to eq(1)
			expect(error).to have_key(:message)
			expect(error[:message]).to be_a(String)
			expect(error[:message]).to eq("Unknown username or password")
    end
  end
end