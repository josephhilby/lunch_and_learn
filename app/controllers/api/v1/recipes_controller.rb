module Api
  module V1
    class RecipesController < ApplicationController
      before_action :check_params, only: [:index]

      def index
        recipes = RecipesFacade.get_recipes(@country)
        render json: RecipesSerializer.new(recipes)
      end

      private

      def check_params
        if !params[:country]
          @country = CountryFacade.random_country
        elsif !CountryFacade.is_a_country(params[:country])
          render json: { message: 'Not Found' }, status: 404
        else
          @country = CountryFacade.is_a_country(params[:country])
        end
      end
    end
  end
end