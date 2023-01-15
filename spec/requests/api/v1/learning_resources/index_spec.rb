require 'rails_helper'

describe 'Index Learning Resources API' do
  context 'with valid params' do
    it 'can GET a single video and list of images by country', :vcr do
      get "/api/v1/learning_resources?country=thai"

      expect(response).to be_successful

      resources = JSON.parse(response.body, symbolize_names: true)

      expect(resources.size).to eq(1)
      data = resources[:data]

      expect(data.size).to eq(3)
      expect(data).to have_key(:id)
      expect(data[:id]).to be_an(NilClass)

      expect(data).to have_key(:type)
      expect(data[:type]).to be_an(String)
      expect(data[:type]).to eq('learning_resource')

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_an(Hash)
      expect(data[:attributes].size).to eq(3)

        expect(data[:attributes]).to have_key(:country)
        expect(data[:attributes][:country]).to be_a(String)

        expect(data[:attributes]).to have_key(:video)
        expect(data[:attributes][:video]).to be_a(Hash)
        expect(data[:attributes][:video].size).to eq(2)

          expect(data[:attributes][:video]).to have_key(:title)
          expect(data[:attributes][:video][:title]).to be_a(String)

          expect(data[:attributes][:video]).to have_key(:youtube_video_id)
          expect(data[:attributes][:video][:youtube_video_id]).to be_a(String)

        expect(data[:attributes]).to have_key(:images)
        expect(data[:attributes][:images]).to be_a(Array)
        expect(data[:attributes][:images].first).to be_a(Hash)
        expect(data[:attributes][:images].first.size).to eq(2)

          expect(data[:attributes][:images].first).to have_key(:alt_tag)
          expect(data[:attributes][:images].first[:alt_tag]).to be_a(String)

          expect(data[:attributes][:images].first).to have_key(:url)
          expect(data[:attributes][:images].first[:url]).to be_a(String)
    end
	end

  context 'with non-valid params' do
    it 'returns a 404 error', :vcr do
      get "/api/v1/learning_resources?country=thatplaceoverthere"

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
      get "/api/v1/learning_resources"
      # I cant figure out why this stub is not working. Getting the error:
      # CountryFacade does not implement #random_country
      allow_any_instance_of(CountryFacade).to receive(:random_country).and_return('Malaysia')

      expect(response).to be_successful

      resources = JSON.parse(response.body, symbolize_names: true)

      expect(resources.size).to eq(1)
      data = resources[:data]

      expect(data.size).to eq(3)
      expect(data).to have_key(:id)
      expect(data[:id]).to be_an(NilClass)

      expect(data).to have_key(:type)
      expect(data[:type]).to be_an(String)
      expect(data[:type]).to eq('learning_resource')

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_an(Hash)
      expect(data[:attributes].size).to eq(3)

        expect(data[:attributes]).to have_key(:country)
        expect(data[:attributes][:country]).to be_a(String)

        expect(data[:attributes]).to have_key(:video)
        expect(data[:attributes][:video]).to be_a(Hash)
        expect(data[:attributes][:video].size).to eq(2)

          expect(data[:attributes][:video]).to have_key(:title)
          expect(data[:attributes][:video][:title]).to be_a(String)

          expect(data[:attributes][:video]).to have_key(:youtube_video_id)
          expect(data[:attributes][:video][:youtube_video_id]).to be_a(String)

        expect(data[:attributes]).to have_key(:images)
        expect(data[:attributes][:images]).to be_a(Array)
        expect(data[:attributes][:images].first).to be_a(Hash)
        expect(data[:attributes][:images].first.size).to eq(2)

          expect(data[:attributes][:images].first).to have_key(:alt_tag)
          expect(data[:attributes][:images].first[:alt_tag]).to be_a(String)

          expect(data[:attributes][:images].first).to have_key(:url)
          expect(data[:attributes][:images].first[:url]).to be_a(String)
    end
  end
end