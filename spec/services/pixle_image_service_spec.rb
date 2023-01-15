require 'rails_helper'

RSpec.describe PixleImageService do
	describe 'class_methods' do
		describe '.search_by_country' do
			it 'returns a JSON object from API', :vcr do
				return_body = PixleImageService.search_by_country('Poland')
				expect(return_body).to be_a(Hash)
				expect(return_body).to have_key(:photos)
				expect(return_body[:photos]).to be_a(Array)

				first_result = return_body[:photos].first
				expect(first_result).to be_a(Hash)

				expect(first_result).to have_key(:alt)
				expect(first_result[:alt]).to be_a(String)

        expect(first_result).to have_key(:url)
				expect(first_result[:url]).to be_a(String)
			end
		end

		describe '.get_url', :vcr do
			it 'returns JSON hash from response body' do
				url = PixleImageService.get_url('/v1/search?query=Poland')
				expect(url).to be_a(Hash)
			end
		end

		describe '.conn', :vcr do
			it 'connects with api.pexels.com' do
				conn = PixleImageService.conn
				expect(conn.params).to be_a(Hash)
			end
		end
	end
end