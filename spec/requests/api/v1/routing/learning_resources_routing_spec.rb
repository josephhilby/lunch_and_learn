require 'rails_helper'

RSpec.describe Api::V1::LearningResourcesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/learning_resources?country=laos').to route_to('api/v1/learning_resources#index', country: 'laos')
    end
  end
end