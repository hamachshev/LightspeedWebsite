module Api
  module V1

    class OrdersController < ApplicationController
      before_action :set_order, only: %i[ show update destroy ]

      # GET /orders
      # GET /orders.json
      def index
        @orders = Order.all
      end

      # GET /orders/1
      # GET /orders/1.json
      def show
      end

      # POST /orders
      # POST /orders.json
      def create
        @order = Order.new(order_params.merge! customer: current_user)

        if @order.save
          render :show, status: :created, location: api_v1_order_url(@order)
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /orders/1
      # PATCH/PUT /orders/1.json
      def update
        if @order.update(order_params)
          render :show, status: :ok, location: api_v1_order_url(@order)
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # DELETE /orders/1
      # DELETE /orders/1.json
      def destroy
        @order.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = Order.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def order_params
          params.require(:order).permit(:product_id, :address_id, :payment_method_id)
        end
    end

  end
end
