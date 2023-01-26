require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/recipes', type: :request do
  before do
    json_response = File.read('spec/fixtures/webmock_data/get_recipes.json')
    stub_request(:get, "https://restcountries.com/v3.1/all").to_return(status: 200, body: json_response)
  end
  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end

  it '/api/v1/recipes' do
    get "/api/v1/recipes"
    require'pry';binding.pry
    run_test!
  end
end
