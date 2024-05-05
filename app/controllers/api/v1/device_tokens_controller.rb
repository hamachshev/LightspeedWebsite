module Api
  module V1

    class DeviceTokensController < ApplicationController
      def create
        current_user.device_token = user_params[0]
        if current_user.save
          render json: {device_token: user_params[0]}
        end
      end


      private
      def user_params
        params.permit(:device_token)
      end
    end
  end
end
