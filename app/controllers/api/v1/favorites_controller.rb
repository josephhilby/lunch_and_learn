module Api
  module V1
    class FavoritesController < ApplicationController

      def index; end

      def create
        new_favorite = Favorite.new(favorite_params)
        user = User.find_by(api_key: params[:api_key])
        if new_favorite.save && user
          new_user_favorite = UsersFavorite.new(user_id: user.id, favorite_id: new_favorite.id)
          render json: { success: "Favorite added successfully" }, status: 201
        elsif !user
          render json: { message: "Invalid api_key" }, status: 401
        else
          render json: { message: new_favorite.errors.full_messages.to_sentence }, status: 400
        end
      end

      def destroy; end

      private

      def favorite_params
        params.permit(:country, :recipe_link, :recipe_title)
      end
    end
  end
end