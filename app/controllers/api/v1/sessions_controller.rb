module Api
  module V1
    class SessionsController < ApplicationController

      def create
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(params[:password])
          render json: UserSerializer.new(user)
        else
          render json: { message: user.errors.full_messages.to_sentence }, status: 400
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end