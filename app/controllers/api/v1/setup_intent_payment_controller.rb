module Api
  module V1

    class SetupIntentPaymentController < ApplicationController
      skip_before_action :doorkeeper_authorize!
      def create
        Stripe.api_key = STRIPE_TEST_API_KEY
        customer = Stripe::Customer.create
        setUpIntent = Stripe::SetupIntent.create customer: customer['id']

        render json: {
          setUpIntent: setUpIntent['client_secret'],
          customer: customer['id'],
          publishableKey: STRIPE_TEST_PUBLISHABLE_KEY
        }
      end
    end
  end
end
