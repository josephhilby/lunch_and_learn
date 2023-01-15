module Api
  module V1
    class SessionsController < ApplicationController

      def create
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
          render json: UserSerializer.new(user)
        else
          render json: { message: "Unknown username or password" }, status: 400
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end