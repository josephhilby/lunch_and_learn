require 'rails_helper'

RSpec.describe Video do
	before do
		attrs = { snippet: { title: 'title' }, id: { videoId: 'videoId' } }
		@video = Video.new(attrs)
	end

	describe 'initialize' do
		it 'exists' do
			expect(@video).to be_a(Video)
		end

		it 'has readible attributes' do
			expect(@video.title).to eq('title')
			expect(@video.youtube_video_id).to eq('videoId')
		end
	end
end