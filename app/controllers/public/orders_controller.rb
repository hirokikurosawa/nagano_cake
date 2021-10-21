class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders

  end

  def new
    @order = current_customer.orders.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.price = cart_item.item.add_tax_price
        @order_items.amount = cart_item.amount
        @order_items.save
        current_customer.cart_items.destroy_all
      end
    redirect_to thanks_orders_path
  end

  def check
    @cart_items = current_customer.cart_items
    @total_price = 0
    case params[:order][:select_address]
    when "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when "1"
      @order = Order.new(order_params)
    else
      redirect_to new_order_path
    end
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :total_payment)
  end

  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :price, :amount)
  end

end
