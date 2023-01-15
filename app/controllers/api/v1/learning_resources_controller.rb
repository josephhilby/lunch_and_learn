module Api
  module V1
    class LearningResourcesController < ApplicationController
      before_action :check_params, only: [:index]

      def index
        video = VideosFacade.get_videos(@country).first
        images = ImagesFacade.get_images(@country)
        country = Country.new(@country)
        learning_resource = LearningResource.new(country, video, images)

        render json: LearningResourcesSerializer.new(learning_resource)
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