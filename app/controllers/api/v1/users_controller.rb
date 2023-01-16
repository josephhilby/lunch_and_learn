module Api
  module V1
    class UsersController < ApplicationController

      def create
        new_user = User.new(user_params)
        # this is not a good solution, need to find a user unique way of generating key
        new_user[:api_key] = SecureRandom.base64
        if new_user.save
          render json: UserSerializer.new(new_user), status: 201
        else
          render json: { message: new_user.errors.full_messages.to_sentence }, status: 400
        end
      end

      private

      def user_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end