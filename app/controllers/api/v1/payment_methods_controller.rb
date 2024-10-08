module Api
  module V1

    class PaymentMethodsController < ApplicationController
      before_action :setup_stripe_api_key

      def index

        payment_methods = Stripe::Customer.list_payment_methods(current_resource_owner.stripe_user_id)
        data = []
        payment_methods['data'].each do |pm|
          method = {
            id: pm['id'],
            brand: pm['card']['brand'],
            exp_month: pm['card']['exp_month'],
            exp_year: pm['card']['exp_year'],
            last4: pm['card']['last4']
          }
          data.append method
        end

        render json: {data: data}

      end
      def create
        setUpIntent = Stripe::SetupIntent.create customer: current_resource_owner.stripe_user_id

        render json: {
          setUpIntent: setUpIntent['client_secret'],
          customer: current_resource_owner.stripe_user_id,
          publishableKey: Rails.application.credentials.dig(:stripe, :test_publishable_key)
        }
      end

      private

      def setup_stripe_api_key
        Stripe.api_key = Rails.application.credentials.dig(:stripe, :test_api_key)
      end

      def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
