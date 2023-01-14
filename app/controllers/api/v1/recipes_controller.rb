module Api
  module V1
    class RecipesController < ApplicationController
      before_action :check_params

      def index
        recipes = RecipesFacade.get_recipes(@country)
      end

      private

      def check_params
        require'pry';binding.pry
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