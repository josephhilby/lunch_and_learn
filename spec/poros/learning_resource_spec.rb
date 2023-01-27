require 'rails_helper'

RSpec.describe LearningResource do
	before do
		country = Country.new('name')
		images = [ Image.new({ alt: 'alt', src: {original: 'org'} }),
               Image.new({ alt: 'alt', src: {original: 'org'} }) ]
		video = Video.new({ snippet: { title: 'title' },
                        id: { videoId: 'videoId' } })

    @learning_resource = LearningResource.new(country, video, images)
	end

	describe 'initialize' do
		it 'exists' do
			expect(@learning_resource).to be_a(LearningResource)
		end

		it 'has readible attributes' do
      country_return = 'name'
      video_return = { title: 'title', youtube_video_id: 'videoId' }
      images_return = [{:alt_tag=>"alt", :url=>"org"}, {:alt_tag=>"alt", :url=>"org"}]
			expect(@learning_resource.country).to eq(country_return)
			expect(@learning_resource.video).to eq(video_return)
			expect(@learning_resource.images).to eq(images_return)
		end
	end
end