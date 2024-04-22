module Api
  module V1

    class SetupIntentPaymentController < ApplicationController
      def create
        Stripe.api_key = ENV['STRIPE_TEST_API_KEY']

        setUpIntent = Stripe::SetupIntent.create customer: current_resource_owner.stripe_user_id

        render json: {
          setUpIntent: setUpIntent['client_secret'],
          customer: current_resource_owner.stripe_user_id,
          publishableKey: ENV['STRIPE_TEST_PUBLISHABLE_KEY']
        }
      end

      def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
