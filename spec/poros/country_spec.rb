require 'rails_helper'

RSpec.describe Country do
	before do
		attrs = 'name'
		@country = Country.new(attrs)
	end

	describe 'initialize' do
		it 'exists' do
			expect(@country).to be_a(Country)
		end

		it 'has readible attributes' do
			expect(@country.country).to eq('name')
		end
	end
end