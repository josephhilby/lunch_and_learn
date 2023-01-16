      # get '/favorites', to: 'favorites#index'
      # post '/favorites', to: 'favorites#create'
      # delete '/favorites', to: 'favorites#destroy'
require 'rails_helper'

RSpec.describe Api::V1::FavoritesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/v1/favorites', params: { api_key: 'key', country: 'country', recipe_link: 'link', recipe_title: 'title' }).to route_to('api/v1/favorites#create')
    end

    it 'routes to #index' do
      expect(get: '/api/v1/favorites?api_key=key').to route_to('api/v1/favorites#index', api_key: 'key')
    end

    xit 'routes to #destroy' do
      expect(delete: '/api/v1/favorites', params: { api_key: 'key', country: 'country', recipe_link: 'link', recipe_title: 'title' }).to route_to('api/v1/favorites#destroy')
    end
  end
end