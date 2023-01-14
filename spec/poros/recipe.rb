
require 'rails_helper'

RSpec.describe Recipe do
	before do
		attrs = { label: 'label', uri: 'uri', image: 'image' }
    country = 'country'
		@recipe = Recipe.new(attrs, country)
	end

	describe 'initialize' do
		it 'exists' do
			expect(@recipe).to be_a(Recipe)
		end

		it 'has readible attributes' do
			expect(@recipe.title).to eq('label')
			expect(@recipe.url).to eq('uri')
			expect(@recipe.country).to eq('country')
			expect(@recipe.image).to eq('image')
		end
	end
end