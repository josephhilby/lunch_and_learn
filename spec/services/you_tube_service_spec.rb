require 'rails_helper'

RSpec.describe YouTubeService do
	describe 'class_methods' do
		describe '.search_mr_history_by_country' do
			it 'returns a JSON object from API', :vcr do
				return_body = YouTubeService.search_mr_history_by_country('Poland')
				expect(return_body).to be_a(Hash)
				expect(return_body).to have_key(:items)
				expect(return_body[:items]).to be_a(Array)

				first_result = return_body[:items].first
				expect(first_result).to be_a(Hash)

				expect(first_result).to have_key(:id)
				expect(first_result[:id]).to be_a(Hash)

				expect(first_result[:id]).to have_key(:videoId)
				expect(first_result[:id][:videoId]).to be_a(String)

        expect(first_result).to have_key(:snippet)
				expect(first_result[:snippet]).to be_a(Hash)

				expect(first_result[:snippet]).to have_key(:title)
				expect(first_result[:snippet][:title]).to be_a(String)
			end
		end

		describe '.get_url', :vcr do
			it 'returns JSON hash from response body' do
				url = YouTubeService.get_url('/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=poland&type=video')
				expect(url).to be_a(Hash)
			end
		end

		describe '.conn', :vcr do
			it 'connects with youtube.googleapis.com' do
				conn = YouTubeService.conn
				expect(conn.params).to be_a(Hash)
			end
		end
	end
end