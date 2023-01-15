require 'rails_helper'

RSpec.describe Image do
	before do
		attrs = { alt: 'alt', url: 'url' }
		@image = Image.new(attrs)
	end

	describe 'initialize' do
		it 'exists' do
			expect(@image).to be_a(Image)
		end

		it 'has readible attributes' do
			expect(@image.alt_tag).to eq('alt')
			expect(@image.url).to eq('url')
		end
	end
end