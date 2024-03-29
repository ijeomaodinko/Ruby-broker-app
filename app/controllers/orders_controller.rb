class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]
  before_action :authenticate_user!
  # GET /orders
  def index
    # @orders = Order.all
    @orders = current_user.orders
    authorize! :read, @orders

    render json: @orders.to_json(include: [:user, :product, :company])
  end

  # GET /orders/1
  def show
    authorize! :read, @orders
    render json: @order.to_json(include: [:user, :product, :company])
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    authorize! :destory, @order
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:product_id, :user_id, :product_name, :quantity, :price, :company_id)
    end
end
