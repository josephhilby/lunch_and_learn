module Api
  module V1
    class FavoritesController < ApplicationController

      def index
        user = User.find_by(api_key: params[:api_key])
        if !user
          render json: { message: "Invalid or missing api_key" }, status: 401
        else
          favorites = user.favorites
          render json: FavoritesSerializer.new(favorites)
        end
      end

      def create
        new_favorite = Favorite.new(favorite_params)
        user = User.find_by(api_key: params[:api_key])
        if new_favorite.save && user
          new_user_favorite = UsersFavorite.create(user_id: user.id, favorite_id: new_favorite.id)
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