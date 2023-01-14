require 'rails_helper'

RSpec.describe RestCountriesService do
	describe 'class_methods' do
		describe '.search' do
			it 'returns a JSON object from API', :vcr do
				return_body = RestCountriesService.search('thai')
				expect(return_body).to be_a(Array)
				expect(return_body.first).to be_a(Hash)

				first_result = return_body.first
				expect(first_result).to have_key(:name)
				expect(first_result[:name]).to be_a(Hash)


				expect(first_result[:name]).to have_key(:common)
				expect(first_result[:name][:common]).to be_a(String)
			end
		end

    describe '.all_countries' do
			it 'returns a JSON object from API', :vcr do
				return_body = RestCountriesService.all_countries
				expect(return_body).to be_a(Array)
				expect(return_body.first).to be_a(Hash)

				first_result = return_body.first
				expect(first_result).to have_key(:name)
				expect(first_result[:name]).to be_a(Hash)


				expect(first_result[:name]).to have_key(:common)
				expect(first_result[:name][:common]).to be_a(String)
			end
		end

		describe '.get_url', :vcr do
			it 'returns JSON hash from response body' do
				url = RestCountriesService.get_url('/v3.1/all')
				expect(url).to be_a(Array)
			end
		end

		describe '.conn', :vcr do
			it 'connects with api.thing.com' do
				conn = RestCountriesService.conn
				expect(conn.params).to be_a(Hash)
			end
		end
	end
end