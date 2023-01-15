module Api
  module V1
    class UsersController < ApplicationController

      def create
        new_user = User.new(user_params)
        new_user[:api_key] = SecureRandom.base64
        if new_user.save
          render json: UserSerializer.new(new_user)
        else
          render json: { message: new_user.errors.full_messages.to_sentence }, status: 400
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end